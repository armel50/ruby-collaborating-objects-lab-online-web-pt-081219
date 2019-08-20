class Song
  @@all = []
  attr_accessor :name, :artist, :artist_name
  def initialize(name)
    @name = name
    @@all << self
  end 
  
  def artist=(artist_object)
    artist_object.songs << self
    @artist = artist_object
    
  end
  
  def self.all
    @@all
  end
  
  def artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
  end 
  
  def self.new_by_filename(file_name) 
    splitted_file = file_name.split(" - ") 
    new_song = Song.new(splitted_file[1]) 
    new_song.artist_name = splitted_file[0]
    
      new_song.artist.songs << self
      new_song
  end
 
end