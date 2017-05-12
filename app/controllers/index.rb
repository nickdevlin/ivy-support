require 'json'
require 'plotly'
require_relative '../helpers/pitch_helper'

get '/' do

  all_pitches = PitchHelper.pitches_with_location

  plotly = PlotLy.new('nickdevlin1', PLOTLY_API_KEY)

  data = {
          x: [-3.75, -3.25, -2.75, -2.25, -1.75, -1.25, -0.75, -0.25, 0.25, 0.75, 1.25, 1.75, 2.25, 2.75, 3.25, 3.75],
          y: [0.25, 0.75, 1.25, 1.75, 2.25, 2.75, 3.25, 3.75, 4.25, 4.75, 5.25, 5.75],
          z: PitchHelper.grid(all_pitches)
        }

  args = {
    filename: 'ruby_test_heat_map',
    fileopt: 'overwrite',
    style: { type: 'contour' },
    layout: {
      title: 'Jon Lester Heatmap',
      shapes: [{
        type: 'rect',
        xref: 'x',
        yref: 'y',
        x0: -0.70833333,
        y0: 1.5,
        x1: 0.70833333,
        y1: 3.5,
        line: {
          color: 'black'
        }
      }]
    },
    world_readable: true
  }

  plotly.plot(data, args) do |response|
    @url = response
  end

  erb :index
end

#location_x min: -2.754
#location_x max: 3.023

#location_z min: -1.654
#location_z max: 5.391

#x-range: [-4, 4]
#z-range: [0, 6]

          # x: [-3.5, -3, -2.5, -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4],
          # y: [0.25, 0.75, 1.25, 1.75, 2.25, 2.75, 3.25, 3.75, 4.25, 4.75, 5.25, 5.75],
          # z: PitchHelper.grid(all_pitches)
