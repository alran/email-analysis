class Watson

include HTTParty

  APIS = {
    sentiment_analysis: "http://gateway-a.watsonplatform.net/calls/text/TextGetTextSentiment"
  }

  attr_accessor :query

  def initialize(venue_params, api_key)
    @query = venue_params
    @query["apikey"] = api_key
    @query["outputMode"] = 'json'
  end

  def text_request(url)
    self.class.post(url,
    :query => query,
    :headers => { "Content-Type" => "application/x-www-form-urlencoded"})
  end

  def sentiment_response(api)
    url = APIS[api.to_sym]
    res = text_request(url)
    res.code == 200 ? res["docSentiment"]["type"] : false #specific to sentiment analysis api
  end

end
