require 'json'
require 'heatmap'
require 'plotly'

# get '/' do
#   @data = JSON.parse(open('lester.json').read)
#   map = Heatmap::Map.new
#   @coordinates = []

#   @data.each do |point|
#     if point["location_x"] && point["location_x"] > -5
#       map << Heatmap::Area.new(point["location_x"] + 3, point["location_z"] + 3)
#       @coordinates << [point["location_x"] + 3, point["location_z"] + 3]
#     end
#   end

#   map.output('test.png')

#   erb :index
# end

# data = open('lester.json').read
# map  = Heatmap.new

# data.each do |point|
#   point = JSON.parse(point)
#   map << Heatmap::Area.new(*point.values)
# end

# map.output('large.png')

get '/' do

plotly = PlotLy.new('nrdevlin', 'zZpuShG5TQlXGT0VonC9')

data = { z: [[1, 20, 1], [1, 30, 1], [1, 20, 1]] }

    args = {
      filename: 'ruby_test_heat_map',
      fileopt: 'overwrite',
      style: { type: 'contour' },
      layout: {
        title: 'Dorky Fun'
      },
      world_readable: true
    }

    plotly.plot(data, args) do |response|
      @url = response['url']
    end



end
