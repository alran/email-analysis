class Watson

include HTTParty

  attr_accessor :query, :headers

  def initialize(params_hash, api_key)
    @query = params_hash
    @query["apikey"] = api_key
    @headers = {}
  end

  def request
    self.class.post("",
    :query => query,
    :headers => headers)
  end

end
