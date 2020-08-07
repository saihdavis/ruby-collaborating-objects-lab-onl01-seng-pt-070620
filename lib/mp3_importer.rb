class MP3Importer
    attr_accessor :path, :filenames
    @@all = []
    def initialize(path)
        @path = path
        @filenames = []
    end

    def files
        Dir.entries(path).each do |filename|
            @filenames << "#{filename}"
        end
        @filenames.delete_if {|x| x == "." || x == ".."}
    end

    def import
        files.each {|song| Song.new_by_filename(song)}
    end
end