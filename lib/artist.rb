class Artist 
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end
  
  def self.all 
    @@all
  end  
  
  def songs 
    @songs
  end
  
  def add_song(song_object)
    song_object.artist = self
  end
  
  def self.find_or_create_by_name(artist_name)
    result = @@all.find{|el| el if el.name = artist_name}
      result = Artist.new(artist_name) if result == nil
     result
  end
  
  def print_songs
    @songs.each{|el| puts el.name}
  end
end