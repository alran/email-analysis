class Gmail

include HTTParty

  base_uri "https://www.googleapis.com/gmail/v1"

  attr_accessor :query

  def initialize(query={q: "in:sent"}, user)
    client = Signet::OAuth2::Client.new(access_token: user.google_oauth2.accesstoken)
    @service = Google::Apis::GmailV1::GmailService.new
    @service.authorization = client
    @query = query
  end

  def messages
    res = @service.list_user_messages('me')
    binding.pry
    res

  end

  def individual_messages_ids
    self.messages.messages.each do |message_thread|
      self.individual_message_request(message_thread.id)
    end
  end

  def individual_message_request(id)
    @service.get_user_message('me', id)
  end

end
