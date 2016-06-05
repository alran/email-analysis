class AnalysesController < ApplicationController

  def show
    analysis = Analysis.find_by(id: params[:id])
    emails = Email.where(user_id: analysis.user_id)
    @people = {}
    emails.each do |email|
      recipient = email.sent_to.gsub(/<.+>/, '').strip
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
          sentiment: sentiment,
          sentiment_score: sentiment_score,
          num_scores: 1
        }
      end
    end
    binding.pry
    analysis.people_sentiment = @people.to_s
    analysis.save
    @people = @people.to_json
  end

  def watson
    @analyses = []
    # take props sent from front end when you click button to get email analysis
    # choose 20 most recent emails and make call to watson_tone_analysis(content)
    # create watson objects for each - push into analyses call
  end

  private

  def watson_tone_analysis(content)
    analysis = get_watson_tone_analysis(content) # analysis also has sentence by sentence breakdown. can be used later
    document_emotions = analysis["document_tone"]["tone_categories"][0]
    document_tone = analysis["document_tone"]["tone_categories"][1]
    document_behavior_traits = analysis["document_tone"]["tone_categories"][2]
    number_sentences = analysis["sentences_tone"].length
  end

  def get_watson_tone_analysis(content)
    content_webified = content.gsub(' ', '%20')
    request_url = 'https://watson-api-explorer.mybluemix.net/tone-analyzer/api/v3/tone?version=2016-05-19&text=' + content_webified
    HTTParty.get(request_url)
  end

end
