module PitchHelper

  def self.all_pitches
    JSON.parse(open('lester.json').read)
  end

  def self.pitches_with_location
    all_pitches.select { |pitch| pitch["location_x"] && pitch["location_z"]}
  end

  def self.sinkers
    all_pitches.select { |pitch| pitch["pitch_type"] == "SI" }
  end

  def self.cutters
    all_pitches.select { |pitch| pitch["pitch_type"] == "FC" }
  end

  def self.fastballs
    all_pitches.select { |pitch| pitch["pitch_type"] == "FA" }
  end

  def self.curveballs
    all_pitches.select { |pitch| pitch["pitch_type"] == "CU" }
  end

  def self.changeups
    all_pitches.select { |pitch| pitch["pitch_type"] == "CU" }
  end

end
