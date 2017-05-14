require 'json'
require 'plotly'
require_relative '../helpers/pitch_helper'

#hardcoded the URL to save on API calls - you only get 50 a day on the free Postly account. The "all pitches" graph could easily be generated anew on each page load, though.
get '/' do
  @url = "https://plot.ly/~nickdevlin1/28.embed"
  erb :index
end

post '/' do
  @url = PitchHelper.update_graph(params["pitch"])
  erb :index
end

#location_x min: -2.754
#location_x max: 3.023

#location_z min: -1.654
#location_z max: 5.391

#x-range: [-4, 4]
#z-range: [0, 6]
