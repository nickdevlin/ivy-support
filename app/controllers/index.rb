require 'json'
require 'plotly'
require_relative '../helpers/pitch_helper'

get '/' do

  #plotly = PlotLy.new('nickdevlin1', PLOTLY_API_KEY)

  # data = {
  #         x: [-3.75, -3.25, -2.75, -2.25, -1.75, -1.25, -0.75, -0.25, 0.25, 0.75, 1.25, 1.75, 2.25, 2.75, 3.25, 3.75],
  #         y: [0.25, 0.75, 1.25, 1.75, 2.25, 2.75, 3.25, 3.75, 4.25, 4.75, 5.25, 5.75],
  #         z: PitchHelper.grid(@pitches_to_graph)
  #       }

  # args = {
  #   filename: 'lester_heat_map',
  #   fileopt: 'overwrite',
  #   style: { type: 'contour' },
  #   layout: {
  #     title: 'Pitches thrown by Jon Lester, 2016-present',
  #     shapes: [{
  #       type: 'rect',
  #       xref: 'x',
  #       yref: 'y',
  #       x0: -0.70833333,
  #       y0: 1.5,
  #       x1: 0.70833333,
  #       y1: 3.5,
  #       line: {
  #         color: 'black'
  #       }
  #     }]
  #   },
  #   world_readable: true
  # }

  #Strike zone width derived from width of plate (17 inches) divided by 12 and then cut in two. Height taken from this Baseball Prospectus article by current Astros Director of Research and Development Mike Fast: http://www.baseballprospectus.com/article.php?articleid=14098

  # plotly.plot(data, args) do |response|
  #   @url = response
  # end

  erb :index
end

post "/" do
  @url = PitchHelper.update_graph(params["pitch"])

  erb :index
end

#location_x min: -2.754
#location_x max: 3.023

#location_z min: -1.654
#location_z max: 5.391

#x-range: [-4, 4]
#z-range: [0, 6]
