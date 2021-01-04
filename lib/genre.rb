require "pry"

class Genre 
    attr_accessor :name, :songs
    extend Concerns::Findable

    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(name)
        self.new(name).save
    end

    def artists
        artists_array = self.songs.collect do |song|
            song.artist
        end
        artists_array.uniq
    end

    def save
        @@all << self
        self
    end

    def add_song(song)
        if song.genre == nil
            song.genre = self
            unless self.songs.include?(song)
                self.songs << song
            end
        else 
            unless self.songs.include?(song)
                self.songs << song
            end
        end
    end

end