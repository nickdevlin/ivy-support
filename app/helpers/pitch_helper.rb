module PitchHelper

  def self.pitches_with_location
    JSON.parse(open('lester.json').read).select { |pitch| pitch["location_x"] && pitch["location_z"]}
  end

  def self.sinkers
    pitches_with_location.select { |pitch| pitch["pitch_type"] == "SI" }
  end

  def self.cutters
    pitches_with_location.select { |pitch| pitch["pitch_type"] == "FC" }
  end

  def self.four_seamers
    pitches_with_location.select { |pitch| pitch["pitch_type"] == "FA" }
  end

  def self.curveballs
    pitches_with_location.select { |pitch| pitch["pitch_type"] == "CU" }
  end

  def self.changeups
    pitches_with_location.select { |pitch| pitch["pitch_type"] == "CH" }
  end

  def self.data(pitch_array)
    {
      x: [-3.75, -3.25, -2.75, -2.25, -1.75, -1.25, -0.75, -0.25, 0.25, 0.75, 1.25, 1.75, 2.25, 2.75, 3.25, 3.75],
      y: [0.25, 0.75, 1.25, 1.75, 2.25, 2.75, 3.25, 3.75, 4.25, 4.75, 5.25, 5.75],
      z: grid(pitch_array)
    }
  end

#Strike zone width derived from width of plate (17 inches) divided by 12 and then cut in two for each side. Height taken from this Baseball Prospectus article by current Astros Director of Research and Development Mike Fast: http://www.baseballprospectus.com/article.php?articleid=14098

  def self.args(pitch_type)
    {
        filename: 'lester_heat_map',
        fileopt: 'new',
        style: { type: 'contour' },
        layout: {
          title: "#{pitch_type} thrown by Jon Lester, 2016-present",
          xaxis: {
            title: 'Distance from middle of plate as it crosses front plane of plate (in feet)'
          },
          yaxis: {
            title: 'Height of ball as it crosses plate (in feet)'
          },
          font: {
            family: 'Courier, monospace'
            },
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
  end

  def self.update_graph(pitch_type)
    if pitch_type == "FA"
        data = data(four_seamers)
        args = args("Four-seamers")
    elsif pitch_type == "FC"
        data = data(cutters)
        args = args("Cutters")
    elsif pitch_type == "SI"
        data = data(sinkers)
        args = args("Sinkers")
    elsif pitch_type == "CU"
        data = data(curveballs)
        args = args("Curveballs")
    elsif pitch_type == "CH"
        data = data(changeups)
        args = args("Changeups")
    else
        data = data(pitches_with_location)
        args = args("All pitches")
    end

    plotly = PlotLy.new('nrdevlin', ENV["PLOTLY_API_KEY"])

    plotly.plot(data, args) do |response|
        @url = response["url"]
    end

    @url + ".embed"
  end


  #After doing this, I realized a more efficient solution, rather than running 192 separate count functions on the same array, would be to assign an integer to each of the 192 pitch location "buckets" below, iterate through the pitch array once, and increase the integer by one on each pitch's bucket as it came through. That would make this grid method about three times as long, as there would need to be steps to set up the if/elsif case for each bucket, assign (or call) the variable for each bucket, and tick its count up by one. The step for creating the grid at the end would remain unchanged.

  #UPDATE: Refactored so that I'm only going through the entire JSON file 12 times instead of 192 - once for each row. Then I'm running counts on each row for each location bucket.

  def self.grid(pitch_array)

    row12 = pitch_array.select { |pitch| pitch["location_z"] > 5.5 }
    box12_1 = row12.count { |pitch| pitch["location_x"] < -3.5 }
    box12_2 = row12.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 }
    box12_3 = row12.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 }
    box12_4 = row12.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 }
    box12_5 = row12.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 }
    box12_6 = row12.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 }
    box12_7 = row12.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 }
    box12_8 = row12.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 }
    box12_9 = row12.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 }
    box12_10 = row12.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 }
    box12_11 = row12.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 }
    box12_12 = row12.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 }
    box12_13 = row12.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 }
    box12_14 = row12.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 }
    box12_15 = row12.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 }
    box12_16 = row12.count { |pitch| pitch["location_x"] >= 3.5 }

    row11 = pitch_array.select { |pitch| pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_1 = row11.count { |pitch| pitch["location_x"] < -3.5 }
    box11_2 = row11.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 }
    box11_3 = row11.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 }
    box11_4 = row11.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 }
    box11_5 = row11.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 }
    box11_6 = row11.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 }
    box11_7 = row11.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 }
    box11_8 = row11.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 }
    box11_9 = row11.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 }
    box11_10 = row11.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 }
    box11_11 = row11.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 }
    box11_12 = row11.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 }
    box11_13 = row11.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 }
    box11_14 = row11.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 }
    box11_15 = row11.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 }
    box11_16 = row11.count { |pitch| pitch["location_x"] >= 3.5 }

    row10 = pitch_array.select { |pitch| pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_1 = row10.count { |pitch| pitch["location_x"] < -3.5 }
    box10_2 = row10.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 }
    box10_3 = row10.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 }
    box10_4 = row10.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 }
    box10_5 = row10.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 }
    box10_6 = row10.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 }
    box10_7 = row10.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 }
    box10_8 = row10.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 }
    box10_9 = row10.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 }
    box10_10 = row10.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 }
    box10_11 = row10.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 }
    box10_12 = row10.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 }
    box10_13 = row10.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 }
    box10_14 = row10.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 }
    box10_15 = row10.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 }
    box10_16 = row10.count { |pitch| pitch["location_x"] >= 3.5 }

    row9 = pitch_array.select { |pitch| pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_1 = row9.count { |pitch| pitch["location_x"] < -3.5 }
    box9_2 = row9.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 }
    box9_3 = row9.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 }
    box9_4 = row9.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 }
    box9_5 = row9.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 }
    box9_6 = row9.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 }
    box9_7 = row9.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 }
    box9_8 = row9.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 }
    box9_9 = row9.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 }
    box9_10 = row9.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 }
    box9_11 = row9.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 }
    box9_12 = row9.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 }
    box9_13 = row9.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 }
    box9_14 = row9.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 }
    box9_15 = row9.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 }
    box9_16 = row9.count { |pitch| pitch["location_x"] >= 3.5 }

    row8 = pitch_array.select { |pitch| pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_1 = row8.count { |pitch| pitch["location_x"] < -3.5 }
    box8_2 = row8.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 }
    box8_3 = row8.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 }
    box8_4 = row8.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 }
    box8_5 = row8.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 }
    box8_6 = row8.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 }
    box8_7 = row8.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 }
    box8_8 = row8.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 }
    box8_9 = row8.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 }
    box8_10 = row8.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 }
    box8_11 = row8.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 }
    box8_12 = row8.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 }
    box8_13 = row8.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 }
    box8_14 = row8.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 }
    box8_15 = row8.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 }
    box8_16 = row8.count { |pitch| pitch["location_x"] >= 3.5 }

    row7 = pitch_array.select { |pitch| pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_1 = row7.count { |pitch| pitch["location_x"] < -3.5 }
    box7_2 = row7.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 }
    box7_3 = row7.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 }
    box7_4 = row7.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 }
    box7_5 = row7.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 }
    box7_6 = row7.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 }
    box7_7 = row7.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 }
    box7_8 = row7.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 }
    box7_9 = row7.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 }
    box7_10 = row7.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 }
    box7_11 = row7.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 }
    box7_12 = row7.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 }
    box7_13 = row7.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 }
    box7_14 = row7.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 }
    box7_15 = row7.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 }
    box7_16 = row7.count { |pitch| pitch["location_x"] >= 3.5 }

    row6 = pitch_array.select { |pitch| pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_1 = row6.count { |pitch| pitch["location_x"] < -3.5 }
    box6_2 = row6.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 }
    box6_3 = row6.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 }
    box6_4 = row6.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 }
    box6_5 = row6.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 }
    box6_6 = row6.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 }
    box6_7 = row6.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 }
    box6_8 = row6.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 }
    box6_9 = row6.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 }
    box6_10 = row6.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 }
    box6_11 = row6.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 }
    box6_12 = row6.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 }
    box6_13 = row6.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 }
    box6_14 = row6.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 }
    box6_15 = row6.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 }
    box6_16 = row6.count { |pitch| pitch["location_x"] >= 3.5 }

    row5 = pitch_array.select { |pitch| pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_1 = row5.count { |pitch| pitch["location_x"] < -3.5 }
    box5_2 = row5.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 }
    box5_3 = row5.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 }
    box5_4 = row5.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 }
    box5_5 = row5.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 }
    box5_6 = row5.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 }
    box5_7 = row5.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 }
    box5_8 = row5.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 }
    box5_9 = row5.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 }
    box5_10 = row5.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 }
    box5_11 = row5.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 }
    box5_12 = row5.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 }
    box5_13 = row5.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 }
    box5_14 = row5.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 }
    box5_15 = row5.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 }
    box5_16 = row5.count { |pitch| pitch["location_x"] >= 3.5 }

    row4 = pitch_array.select { |pitch| pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_1 = row4.count { |pitch| pitch["location_x"] < -3.5 }
    box4_2 = row4.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 }
    box4_3 = row4.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 }
    box4_4 = row4.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 }
    box4_5 = row4.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 }
    box4_6 = row4.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 }
    box4_7 = row4.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 }
    box4_8 = row4.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 }
    box4_9 = row4.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 }
    box4_10 = row4.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 }
    box4_11 = row4.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 }
    box4_12 = row4.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 }
    box4_13 = row4.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 }
    box4_14 = row4.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 }
    box4_15 = row4.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 }
    box4_16 = row4.count { |pitch| pitch["location_x"] >= 3.5 }

    row3 = pitch_array.select { |pitch| pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_1 = row3.count { |pitch| pitch["location_x"] < -3.5 }
    box3_2 = row3.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 }
    box3_3 = row3.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 }
    box3_4 = row3.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 }
    box3_5 = row3.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 }
    box3_6 = row3.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 }
    box3_7 = row3.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 }
    box3_8 = row3.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 }
    box3_9 = row3.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 }
    box3_10 = row3.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 }
    box3_11 = row3.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 }
    box3_12 = row3.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 }
    box3_13 = row3.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 }
    box3_14 = row3.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 }
    box3_15 = row3.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 }
    box3_16 = row3.count { |pitch| pitch["location_x"] >= 3.5 }

    row2 = pitch_array.select { |pitch| pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_1 = row2.count { |pitch| pitch["location_x"] < -3.5 }
    box2_2 = row2.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 }
    box2_3 = row2.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 }
    box2_4 = row2.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 }
    box2_5 = row2.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 }
    box2_6 = row2.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 }
    box2_7 = row2.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 }
    box2_8 = row2.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 }
    box2_9 = row2.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 }
    box2_10 = row2.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 }
    box2_11 = row2.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 }
    box2_12 = row2.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 }
    box2_13 = row2.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 }
    box2_14 = row2.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 }
    box2_15 = row2.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 }
    box2_16 = row2.count { |pitch| pitch["location_x"] >= 3.5 }

    row1 = pitch_array.select { |pitch| pitch["location_z"] <= 0.5 }
    box1_1 = row1.count { |pitch| pitch["location_x"] < -3.5 }
    box1_2 = row1.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 }
    box1_3 = row1.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 }
    box1_4 = row1.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 }
    box1_5 = row1.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 }
    box1_6 = row1.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 }
    box1_7 = row1.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 }
    box1_8 = row1.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 }
    box1_9 = row1.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 }
    box1_10 = row1.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 }
    box1_11 = row1.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 }
    box1_12 = row1.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 }
    box1_13 = row1.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 }
    box1_14 = row1.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 }
    box1_15 = row1.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 }
    box1_16 = row1.count { |pitch| pitch["location_x"] >= 3.5 }

    return [
            [box1_1, box1_2, box1_3, box1_4, box1_5, box1_6, box1_7, box1_8, box1_9, box1_10, box1_11, box1_12, box1_13, box1_14, box1_15, box1_16],
            [box2_1, box2_2, box2_3, box2_4, box2_5, box2_6, box2_7, box2_8, box2_9, box2_10, box2_11, box2_12, box2_13, box2_14, box2_15, box2_16],
            [box3_1, box3_2, box3_3, box3_4, box3_5, box3_6, box3_7, box3_8, box3_9, box3_10, box3_11, box3_12, box3_13, box3_14, box3_15, box3_16],
            [box4_1, box4_2, box4_3, box4_4, box4_5, box4_6, box4_7, box4_8, box4_9, box4_10, box4_11, box4_12, box4_13, box4_14, box4_15, box4_16],
            [box5_1, box5_2, box5_3, box5_4, box5_5, box5_6, box5_7, box5_8, box5_9, box5_10, box5_11, box5_12, box5_13, box5_14, box5_15, box5_16],
            [box6_1, box6_2, box6_3, box6_4, box6_5, box6_6, box6_7, box6_8, box6_9, box6_10, box6_11, box6_12, box6_13, box6_14, box6_15, box6_16],
            [box7_1, box7_2, box7_3, box7_4, box7_5, box7_6, box7_7, box7_8, box7_9, box7_10, box7_11, box7_12, box7_13, box7_14, box7_15, box7_16],
            [box8_1, box8_2, box8_3, box8_4, box8_5, box8_6, box8_7, box8_8, box8_9, box8_10, box8_11, box8_12, box8_13, box8_14, box8_15, box8_16],
            [box9_1, box9_2, box9_3, box9_4, box9_5, box9_6, box9_7, box9_8, box9_9, box9_10, box9_11, box9_12, box9_13, box9_14, box9_15, box9_16],
            [box10_1, box10_2, box10_3, box10_4, box10_5, box10_6, box10_7, box10_8, box10_9, box10_10, box10_11, box10_12, box10_13, box10_14, box10_15, box10_16],
            [box11_1, box11_2, box11_3, box11_4, box11_5, box11_6, box11_7, box11_8, box11_9, box11_10, box11_11, box11_12, box11_13, box11_14, box11_15, box11_16],
            [box12_1, box12_2, box12_3, box12_4, box12_5, box12_6, box12_7, box12_8, box12_9, box12_10, box12_11, box12_12, box12_13, box12_14, box12_15, box12_16]
          ]
  end

end
