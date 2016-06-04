class Gmail

include HTTParty

  base_uri "https://www.googleapis.com/gmail/v1"

  attr_accessor :query, :email, :headers

  def initialize(query, user)
    @query = query
    @query["key"] = user.google_oauth2.accesstoken
    @email = user.google_oauth2.email

  end

  def messages
    client = Signet::OAuth2::Client.new(access_token: self.query["key"])
    service = Google::Apis::GmailV1::GmailService.new
    service.authorization = client
    res = service.list_user_messages('me')
    res
  end


end
