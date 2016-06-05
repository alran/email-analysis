class Gmail

include HTTParty

  base_uri "https://www.googleapis.com/gmail/v1"

  attr_accessor :query

  def initialize(user)
    client = Signet::OAuth2::Client.new(access_token: user.google_oauth2.accesstoken)
    @service = Google::Apis::GmailV1::GmailService.new
    @service.authorization = client
    @current_user_email = user.google_oauth2.email
    @current_user_id = user.google_oauth2.id
  end

  def messages
    @service.list_user_messages('me',{"q": "in:sent", "max_results": 3})
    binding.pry
  end

  def individual_messages_ids
    self.messages.messages.each do |message_thread|
      res = self.individual_message_request(message_thread.id)
      sent_to = self.find_sent_to_user(res)
      Email.create(user_id: @current_user_id, sent_to: sent_to, sent_by: @current_user_email)
    end
  end

  def individual_message_request(id)
    res = @service.get_user_message('me', id)
  end

  def find_sent_to_user(res)
    res.payload.headers.each {|val|return val.value if val.name.match(/To/)}
  end


end
