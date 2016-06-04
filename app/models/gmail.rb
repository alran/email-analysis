class Gmail

include HTTParty

  base_uri "https://www.googleapis.com/gmail/v1"

  attr_accessor :query

  def initialize(query={q: "in:sent", "max_results": 20}, user)
    client = Signet::OAuth2::Client.new(access_token: user.google_oauth2.accesstoken)
    @service = Google::Apis::GmailV1::GmailService.new
    @service.authorization = client
    @current_user_email = user.google_oauth2.email
    @query = query
  end

  def messages
    @service.list_user_messages('me')
  end

  def individual_messages_ids
    self.messages.messages.each do |message_thread|
      res = self.individual_message_request(message_thread.id)
      # sent_to = self.find_sent_to_user(res)
    end
  end

  def individual_message_request(id)
    res = @service.get_user_message('me', id)
  end

  def find_sent_to_user(res)
    res.payload.headers.each {return val.name if val.name.match(/To/)}
  end


end
