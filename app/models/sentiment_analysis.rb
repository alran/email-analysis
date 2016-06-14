class SentimentAnalysis < Watson

  base_uri "http://gateway-a.watsonplatform.net/calls"

  def initialize(params_hash, api_key)
    super(params_hash, api_key)
    @query["outputMode"] = 'json'
    @headers = { "Content-Type" => "application/x-www-form-urlencoded"}
  end

  def post_content(url_search)
    self.class.post(url_search,
    :query => query,
    :headers => headers)
  end

  def text_sentiment
    self.post_content("/text/TextGetTextSentiment")
  end


  def text_targeted_sentiment(targets)
    @query["targets"] = targets
    res = self.post_content("/text/TextGetTargetedSentiment")
    @query.delete("targets")
    res
  end

end