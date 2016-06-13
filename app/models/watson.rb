class WatsonSentiment

include HTTParty

  base_uri "http://gateway-a.watsonplatform.net/calls/text/TextGetTextSentiment"

  attr_accessor :query

  def initialize(venue_params)
    @query = venue_params
    @query["apikey"] = ENV["WATSON_SENTIMENT_API_KEY"]
    @query["outputMode"] = 'json'
  end

  def text_request
    self.class.post("http://gateway-a.watsonplatform.net/calls/text/TextGetTextSentiment",
    :query => query,
    :headers => { "Content-Type" => "application/x-www-form-urlencoded"})
  end

  def sentiment_response
    res = text_request
    res.code == 200 ? res["docSentiment"]["type"] : false
  end

end
