class Gmail

include HTTParty

  base_uri "https://www.googleapis.com/gmail/v1"

  attr_accessor :query, :email

  def initialize(query, user)
    @query = query
    @query["key"] = user.google_oauth2.accesstoken
    @email = user.google_oauth2.email
  end

  def messages
    # required params userId
    transposed = self.email.gsub!("@","%40")
    binding.pry
    url = "/users/#{transposed}/messages"
    res = self.class.get(url, :query => query)
    binding.pry
  end


end
