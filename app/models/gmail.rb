class Gmail

include HTTParty

  base_uri "https://www.googleapis.com/gmail/v1/"

  attr_accessor :query, :current_response

  # http://localhost:3000/venues/search?name=saint%20vitus&latitude=40.736769&longitude=-73.954998 search params for venue

  def initialize(venue_params)
    @query = venue_params
    @query["key"] = ENV["GOOGLE_PLACES_KEY"]
    @current_response = ""
  end

end
