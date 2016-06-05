class Gmail

include HTTParty

  base_uri "https://www.googleapis.com/gmail/v1"
  REGEX = /.*(?=On [a-zA-Z]{3} \d{1,2}, 20[0-1][0-9], at ([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9] [APap][mM])/
  REGEX2 = /.*(?=On [a-zA-Z]{3,4}, [a-zA-Z]{3,4} \d{1,2}, 20[0-1][0-9], ([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9] [APap][mM])/
  REGEX3 = /.*(?=On [a-zA-Z]{3,4}, [a-zA-Z]{3,4} \d{1,2}, 20[0-1][0-9] at ([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9] [APap][mM])/
  REGEX4 = /.*(?=<.*> wrote)/

  attr_accessor :query

  def initialize(user)
    client = Signet::OAuth2::Client.new(access_token: user.google_oauth2.accesstoken)
    @service = Google::Apis::GmailV1::GmailService.new
    @service.authorization = client
    @current_user_email = user.google_oauth2.email
    @current_user_id = user.google_oauth2.id
  end

  def messages
    @service.list_user_messages('me',{"q": "in:sent"})
  end

  def individual_messages_ids
    self.messages.messages.each do |message_thread|
      next if Email.find_by(google_id: message_thread.id)
      res = self.individual_message_request(message_thread.id)
      sent_to = self.find_sent_to_user(res)
      content = self.find_email_content(res)
      next if content.nil?

      email = Email.new(user_id: @current_user_id, sent_to: sent_to, sent_by: @current_user_email, content: content, google_id: message_thread.id)
      email.save
      if email.content
        analysis = Hpehaven.new({text: email.content})
        sentiment = analysis.sentiment_response
        if sentiment
          score = sentiment["score"] * 100
          email.update_attributes(sentiment: sentiment["sentiment"], sentiment_score: score )
        end
      end
    end
  end

  def find_email_content(res)
    if res.payload.parts && res.payload.parts.first.body.data
      string = res.payload.parts.first.body.data.gsub(/\s+/," ")
      string.match(REGEX4||REGEX3||REGEX2||REGEX)
    elsif res.payload.body && res.payload.body.data
      string = res.payload.body.data.gsub(/\s+/," ")
    else
      nil
    end
  end


  def individual_message_request(id)
    res = @service.get_user_message('me', id)
  end

  def find_sent_to_user(res)
    res.payload.headers.each {|val|return val.value if val.name.match(/To/)}
  end


end
