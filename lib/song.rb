class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      #if self.find_by_name(name)
      #  self.find_by_name(name)
      #else
      #  self.create_by_name(name)
      #end
      # above is same as below
      self.find_by_name(name) || self.create_by_name(name)
  end


  def self.alphabetical
    @@all.sort_by! { |song| song.name }
  end

  def self.new_from_filename(file_name)
    data = file_name.split(" - ")
    artist = data[0]
    name = data[1]
    song = self.new
    song.name = name.chomp(".mp3")
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    @@all << song
  end

  def self.destroy_all
    self.all.clear
  end
end
