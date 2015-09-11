class Track < OpenStruct

  def self.tracks

  end

  def self.all
    tracks.map { |track| new(track) }
  end

  def self.find(id)
    Track.new(service.track(id))
  end
end