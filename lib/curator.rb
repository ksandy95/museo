require 'pry'

class Curator

  attr_reader :artists, :photographs
  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photograph)
    @photographs << Photograph.new(photograph)
  end

  def add_artist(artist)
    @artists << Artist.new(artist)
    # binding.pry
  end

  def find_artist_by_id(id)
    @artists.map do |artist|
      if artist.id == id
        return artist
      end
    end
  end

  def find_photograph_by_id(id)
    @photographs.map do |photograph|
      if photograph.id == id
        return photograph
      end
    end
  end

  def find_photographs_by_artist(artist)
      artists_photos = @photographs.group_by{|artist| artist.artist_id}
      if artists_photos.keys.include?(artist.first.last)
        return artists_photos[artist.first.last]
      end
  end

  def artists_with_multiple_photographs
    @artists.map do |artist|
      artists_photos = @photographs.group_by{|artist| artist.artist_id}
        if artists_photos[artist.first.last].values.count > 1
          return artist
      end
    end
  end

  def photographs_taken_by_artist_from(country)
    #It returns an Array of Photographs that were
    #taken by a photographer from that country.
  end

end
