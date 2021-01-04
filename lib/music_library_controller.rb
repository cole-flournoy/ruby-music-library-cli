require "pry"

class MusicLibraryController

    def initialize(path = "./db/mp3s")
        new_imp = MusicImporter.new(path)
        new_imp.import
    end

    def call 
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        command = gets.chomp
        # if command == "list songs"
        # elsif command == "list artists"
        # elsif command == "list genres"
        # elsif command == "list artist"
        # elsif command == "list genre"
        # elsif command == "play song"
        # end 
        if command != "exit"
            self.call
        end
    end

    def list_songs
        binding.pry
        sorted = Song.all.sort_by{|song| song.name}
        x = 1
        sorted.each do |song|
            puts "#{x+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

end