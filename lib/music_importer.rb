class MusicImporter
    attr_accessor :path

    @@library = []

    def initialize(path)
        @path = path
    end
 
    def files
        Dir.chdir(self.path) do
            filenames = Dir.glob("*.mp3")
        end
    end

    def import
        files.each do |filename|
            Song.create_from_filename(filename)
            @@library << filename
        end 
    end
end