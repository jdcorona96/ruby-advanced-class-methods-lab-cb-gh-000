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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      @@all.each do |song|
        if song.name == name
          return song
        end
      end
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(file)
    info = file.split(" - ")
    song = self.new
    song.name = info[1].chomp(".mp3")
    song.artist_name = info[0]
    song
  end

  def self.create_from_filename(file)
    song = new_from_filename(file)
    song.save
  end
end
