module PitchHelper

  def self.all_pitches
    JSON.parse(open('lester.json').read)
  end

  def self.pitches_with_location
    all_pitches.select { |pitch| pitch["location_x"] && pitch["location_z"]}
  end

  def self.sinkers
    pitches_with_location.select { |pitch| pitch["pitch_type"] == "SI" }
  end

  def self.cutters
    pitches_with_location.select { |pitch| pitch["pitch_type"] == "FC" }
  end

  def self.fastballs
    pitches_with_location.select { |pitch| pitch["pitch_type"] == "FA" || pitch["pitch_type"] == "FC" }
  end

  def self.curveballs
    pitches_with_location.select { |pitch| pitch["pitch_type"] == "CU" }
  end

  def self.changeups
    pitches_with_location.select { |pitch| pitch["pitch_type"] == "CU" }
  end

  def self.grid(pitch_array)
    box12_1 = pitch_array.count { |pitch| pitch["location_x"] < -3.5 && pitch["location_z"] > 5.5 }
    box12_2 = pitch_array.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 && pitch["location_z"] > 5.5 }
    box12_3 = pitch_array.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 && pitch["location_z"] > 5.5 }
    box12_4 = pitch_array.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 && pitch["location_z"] > 5.5 }
    box12_5 = pitch_array.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 && pitch["location_z"] > 5.5 }
    box12_6 = pitch_array.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 && pitch["location_z"] > 5.5 }
    box12_7 = pitch_array.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 && pitch["location_z"] > 5.5 }
    box12_8 = pitch_array.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 && pitch["location_z"] > 5.5 }
    box12_9 = pitch_array.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 && pitch["location_z"] > 5.5 }
    box12_10 = pitch_array.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 && pitch["location_z"] > 5.5 }
    box12_11 = pitch_array.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 && pitch["location_z"] > 5.5 }
    box12_12 = pitch_array.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 && pitch["location_z"] > 5.5 }
    box12_13 = pitch_array.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 && pitch["location_z"] > 5.5 }
    box12_14 = pitch_array.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 && pitch["location_z"] > 5.5 }
    box12_15 = pitch_array.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 && pitch["location_z"] > 5.5 }
    box12_16 = pitch_array.count { |pitch| pitch["location_x"] >= 3.5 && pitch["location_z"] > 5.5 }

    box11_1 = pitch_array.count { |pitch| pitch["location_x"] < -3.5 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_2 = pitch_array.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_3 = pitch_array.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_4 = pitch_array.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_5 = pitch_array.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_6 = pitch_array.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_7 = pitch_array.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_8 = pitch_array.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_9 = pitch_array.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_10 = pitch_array.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_11 = pitch_array.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_12 = pitch_array.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_13 = pitch_array.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_14 = pitch_array.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_15 = pitch_array.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }
    box11_16 = pitch_array.count { |pitch| pitch["location_x"] >= 3.5 && pitch["location_z"] > 5 && pitch["location_z"] <= 5.5 }

    box10_1 = pitch_array.count { |pitch| pitch["location_x"] < -3.5 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_2 = pitch_array.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_3 = pitch_array.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_4 = pitch_array.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_5 = pitch_array.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_6 = pitch_array.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_7 = pitch_array.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_8 = pitch_array.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_9 = pitch_array.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_10 = pitch_array.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_11 = pitch_array.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_12 = pitch_array.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_13 = pitch_array.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_14 = pitch_array.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_15 = pitch_array.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }
    box10_16 = pitch_array.count { |pitch| pitch["location_x"] >= 3.5 && pitch["location_z"] > 4.5 && pitch["location_z"] <= 5 }

    box9_1 = pitch_array.count { |pitch| pitch["location_x"] < -3.5 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_2 = pitch_array.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_3 = pitch_array.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_4 = pitch_array.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_5 = pitch_array.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_6 = pitch_array.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_7 = pitch_array.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_8 = pitch_array.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_9 = pitch_array.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_10 = pitch_array.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_11 = pitch_array.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_12 = pitch_array.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_13 = pitch_array.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_14 = pitch_array.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_15 = pitch_array.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }
    box9_16 = pitch_array.count { |pitch| pitch["location_x"] >= 3.5 && pitch["location_z"] > 4 && pitch["location_z"] <= 4.5 }

    box8_1 = pitch_array.count { |pitch| pitch["location_x"] < -3.5 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_2 = pitch_array.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_3 = pitch_array.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_4 = pitch_array.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_5 = pitch_array.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_6 = pitch_array.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_7 = pitch_array.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_8 = pitch_array.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_9 = pitch_array.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_10 = pitch_array.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_11 = pitch_array.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_12 = pitch_array.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_13 = pitch_array.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_14 = pitch_array.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_15 = pitch_array.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }
    box8_16 = pitch_array.count { |pitch| pitch["location_x"] >= 3.5 && pitch["location_z"] > 3.5 && pitch["location_z"] <= 4 }

    box7_1 = pitch_array.count { |pitch| pitch["location_x"] < -3.5 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_2 = pitch_array.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_3 = pitch_array.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_4 = pitch_array.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_5 = pitch_array.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_6 = pitch_array.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_7 = pitch_array.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_8 = pitch_array.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_9 = pitch_array.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_10 = pitch_array.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_11 = pitch_array.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_12 = pitch_array.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_13 = pitch_array.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_14 = pitch_array.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_15 = pitch_array.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }
    box7_16 = pitch_array.count { |pitch| pitch["location_x"] >= 3.5 && pitch["location_z"] > 3 && pitch["location_z"] <= 3.5 }

    box6_1 = pitch_array.count { |pitch| pitch["location_x"] < -3.5 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_2 = pitch_array.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_3 = pitch_array.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_4 = pitch_array.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_5 = pitch_array.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_6 = pitch_array.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_7 = pitch_array.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_8 = pitch_array.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_9 = pitch_array.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_10 = pitch_array.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_11 = pitch_array.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_12 = pitch_array.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_13 = pitch_array.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_14 = pitch_array.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_15 = pitch_array.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }
    box6_16 = pitch_array.count { |pitch| pitch["location_x"] >= 3.5 && pitch["location_z"] > 2.5 && pitch["location_z"] <= 3 }

    box5_1 = pitch_array.count { |pitch| pitch["location_x"] < -3.5 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_2 = pitch_array.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_3 = pitch_array.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_4 = pitch_array.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_5 = pitch_array.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_6 = pitch_array.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_7 = pitch_array.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_8 = pitch_array.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_9 = pitch_array.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_10 = pitch_array.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_11 = pitch_array.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_12 = pitch_array.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_13 = pitch_array.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_14 = pitch_array.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_15 = pitch_array.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }
    box5_16 = pitch_array.count { |pitch| pitch["location_x"] >= 3.5 && pitch["location_z"] > 2 && pitch["location_z"] <= 2.5 }

    box4_1 = pitch_array.count { |pitch| pitch["location_x"] < -3.5 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_2 = pitch_array.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_3 = pitch_array.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_4 = pitch_array.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_5 = pitch_array.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_6 = pitch_array.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_7 = pitch_array.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_8 = pitch_array.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_9 = pitch_array.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_10 = pitch_array.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_11 = pitch_array.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_12 = pitch_array.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_13 = pitch_array.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_14 = pitch_array.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_15 = pitch_array.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }
    box4_16 = pitch_array.count { |pitch| pitch["location_x"] >= 3.5 && pitch["location_z"] > 1.5 && pitch["location_z"] <= 2 }

    box3_1 = pitch_array.count { |pitch| pitch["location_x"] < -3.5 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_2 = pitch_array.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_3 = pitch_array.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_4 = pitch_array.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_5 = pitch_array.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_6 = pitch_array.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_7 = pitch_array.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_8 = pitch_array.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_9 = pitch_array.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_10 = pitch_array.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_11 = pitch_array.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_12 = pitch_array.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_13 = pitch_array.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_14 = pitch_array.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_15 = pitch_array.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }
    box3_16 = pitch_array.count { |pitch| pitch["location_x"] >= 3.5 && pitch["location_z"] > 1 && pitch["location_z"] <= 1.5 }

    box2_1 = pitch_array.count { |pitch| pitch["location_x"] < -3.5 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_2 = pitch_array.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_3 = pitch_array.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_4 = pitch_array.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_5 = pitch_array.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_6 = pitch_array.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_7 = pitch_array.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_8 = pitch_array.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_9 = pitch_array.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_10 = pitch_array.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_11 = pitch_array.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_12 = pitch_array.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_13 = pitch_array.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_14 = pitch_array.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_15 = pitch_array.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }
    box2_16 = pitch_array.count { |pitch| pitch["location_x"] >= 3.5 && pitch["location_z"] > 0.5 && pitch["location_z"] <= 1 }

    box1_1 = pitch_array.count { |pitch| pitch["location_x"] < -3.5 && pitch["location_z"] <= 0.5 }
    box1_2 = pitch_array.count { |pitch| pitch["location_x"] < -3 && pitch["location_x"] >= -3.5 && pitch["location_z"] <= 0.5 }
    box1_3 = pitch_array.count { |pitch| pitch["location_x"] < -2.5 && pitch["location_x"] >= -3 && pitch["location_z"] <= 0.5 }
    box1_4 = pitch_array.count { |pitch| pitch["location_x"] < -2 && pitch["location_x"] >= -2.5 && pitch["location_z"] <= 0.5 }
    box1_5 = pitch_array.count { |pitch| pitch["location_x"] < -1.5 && pitch["location_x"] >= -2 && pitch["location_z"] <= 0.5 }
    box1_6 = pitch_array.count { |pitch| pitch["location_x"] < -1 && pitch["location_x"] >= -1.5 && pitch["location_z"] <= 0.5 }
    box1_7 = pitch_array.count { |pitch| pitch["location_x"] < -0.5 && pitch["location_x"] >= -1 && pitch["location_z"] <= 0.5 }
    box1_8 = pitch_array.count { |pitch| pitch["location_x"] < 0 && pitch["location_x"] >= -0.5 && pitch["location_z"] <= 0.5 }
    box1_9 = pitch_array.count { |pitch| pitch["location_x"] < 0.5 && pitch["location_x"] >= 0 && pitch["location_z"] <= 0.5 }
    box1_10 = pitch_array.count { |pitch| pitch["location_x"] < 1 && pitch["location_x"] >= 0.5 && pitch["location_z"] <= 0.5 }
    box1_11 = pitch_array.count { |pitch| pitch["location_x"] < 1.5 && pitch["location_x"] >= 1 && pitch["location_z"] <= 0.5 }
    box1_12 = pitch_array.count { |pitch| pitch["location_x"] < 2 && pitch["location_x"] >= 1.5 && pitch["location_z"] <= 0.5 }
    box1_13 = pitch_array.count { |pitch| pitch["location_x"] < 2.5 && pitch["location_x"] >= 2 && pitch["location_z"] <= 0.5 }
    box1_14 = pitch_array.count { |pitch| pitch["location_x"] < 3 && pitch["location_x"] >= 2.5 && pitch["location_z"] <= 0.5 }
    box1_15 = pitch_array.count { |pitch| pitch["location_x"] < 3.5 && pitch["location_x"] >= 3 && pitch["location_z"] <= 0.5 }
    box1_16 = pitch_array.count { |pitch| pitch["location_x"] >= 3.5 && pitch["location_z"] <= 1 }

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
