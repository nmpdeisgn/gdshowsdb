module Gdshowsdb
  class SongRefYAMLParser
    def self.from_yaml
      SongRefYAMLParser.new(Gdshowsdb.load_yaml('song_refs.yaml'))
    end

    def initialize(song_ref_list)
      @song_ref_list = song_ref_list
    end

    def parse
      @song_ref_list.map do |song_ref|
        key = song_ref.keys.first
        value = song_ref[key]
        { uuid: value, name: key }
      end        
    end
  end
end