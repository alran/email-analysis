class AnalysesController < ApplicationController

  def watson
    @analyses = []
    @receiver = response.request.params[:email] + "." +  response.request.params["format"]
    emails = Email.where(user_id: current_user.id, sent_to: @receiver)
    emails.each do |email|
      content = email.content.gsub(' ', '%20') ## this may not be robust enough
      analysis = SentimentAnalysis.new({text: content}, ENV["WATSON_SENTIMENT_API_KEY"])
      binding.pry
      sentiment = analysis.text_sentiment["docSentiment"]["type"]
      @analyses << sentiment
    end
  end

  def show
    analysis = Analysis.find_by(id: params[:id])
    emails = Email.where(user_id: analysis.user_id)
    @people = {}
    emails.each do |email|
      recipient = email.sent_to.gsub(/<.+>/, '').strip
      recipient_email = email.sent_to
      sentiment = email.sentiment
      if email.sentiment_score
        sentiment_score = email.sentiment_score
      else
        sentiment_score = 0
      end
      if @people[recipient]
        @people[recipient][:sentiment_score] = (@people[recipient][:sentiment_score] + sentiment_score) / 2
        @people[recipient][:num_scores] = @people[recipient][:num_scores] + 1
      elsif recipient != ""
        @people[recipient] = {
          name: recipient,
          email: recipient_email,
          sentiment: sentiment,
          sentiment_score: sentiment_score,
          num_scores: 1
        }
      end
    end
    analysis.people_sentiment = @people.to_s
    analysis.save
    @people = @people.to_json
  end


  private

  def watson_tone_analysis(content)
    analysis = get_watson_tone_analysis(content) # analysis also has sentence by sentence breakdown. can be used later
    document_emotions = analysis["document_tone"]["tone_categories"][0]
    document_tone = analysis["document_tone"]["tone_categories"][1]
    document_behavior_traits = analysis["document_tone"]["tone_categories"][2]
    number_sentences = analysis["sentences_tone"].length
    {document_emotions: document_emotions, document_tone: document_tone, document_behavior_traits: document_behavior_traits, number_sentences: number_sentences}
  end

end
