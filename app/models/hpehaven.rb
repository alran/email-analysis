class Hpehaven

include HTTParty

  base_uri "https://api.havenondemand.com/1/api/sync/analyzesentiment/v1"

  attr_accessor :query

  def initialize(venue_params)
    @query = venue_params
    @query["apikey"] = ENV["HPE_API_KEY"]
  end

  def text_request
    self.class.get("",:query => query)
  end

  def sentiment_response
    res = text_request
    res.code == 200 ? res["aggregate"] : false
  end

end
