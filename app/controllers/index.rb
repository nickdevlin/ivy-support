require 'json'
require 'plotly'
require_relative '../helpers/pitch_helper'

get '/' do

  @pitches = PitchHelper.pitches_with_location.max_by { |pitch| pitch["location_z"] }

  plotly = PlotLy.new('nrdevlin', PLOTLY_API_KEY)

  data = {
          x: [-2, -1, 0, 1, 2],
          y: [0, 1, 2],
          z: [[0, 20, 1, 6, 8], [0, 30, 1, 7, 25], [0, 12, 1, 20, 1]]
        }

  args = {
    filename: 'ruby_test_heat_map',
    fileopt: 'overwrite',
    style: { type: 'heatmap' },
    layout: {
      title: 'Jon Lester Heatmap'
    },
    world_readable: true
  }

  plotly.plot(data, args) do |response|
  end

  erb :index
end

#location_x min: -2.754
#location_x max: 3.023

#location_z min: -1.654
#location_z max: 5.391
