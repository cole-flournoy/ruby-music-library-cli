class Song 
    attr_accessor :name, :artist, :genre

    @@all = []
    
    def initialize(name, artist = nil, genre = nil)
        @name = name
        unless artist == nil
            self.artist = artist
        end
        unless genre == nil
            self.genre = genre
        end
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(name)
        song = self.new(name).save
    end

    def self.find_by_name(name)
        @@all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name) == nil
            self.create(name)
        else
            self.find_by_name(name)
        end 
    end

    def self.new_from_filename(filename)
        filename.slice!(File.extname(filename))
        art_name = filename.split(" - ")[0]
        song_name = filename.split(" - ")[1]
        gen_name = filename.split(" - ")[2]
        song = Song.new(song_name)
        song.artist_name = art_name
        song.genre_name = gen_name
        song
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song.save
    end

    def artist_name=(name)
        artist_obj = Artist.find_or_create_by_name(name)
        self.artist = artist_obj
    end

    def genre_name=(name)
        genre_obj = Genre.find_or_create_by_name(name)
        self.genre = genre_obj
    end

    def save
        @@all << self
        self
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end
end