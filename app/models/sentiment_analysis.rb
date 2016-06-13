class SentimentAnalysis < Watson

  base_uri "http://gateway-a.watsonplatform.net/calls/text/TextGetTextSentiment"

def initialize(params_hash, api_key)
  super(params_hash, api_key)
  @query["outputMode"] = 'json'
  @headers = { "Content-Type" => "application/x-www-form-urlencoded"}
end

 def sentiment_response
    res = self.request
    res.code == 200 ? res["docSentiment"]["type"] : false #specific to sentiment analysis api
 end


end