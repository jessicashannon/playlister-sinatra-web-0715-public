class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name.gsub(" ","-").downcase
  end

  def self.find_by_slug(slug)
    deslug = slug.split("-").map{|i|i.capitalize}.join(" ")
    Genre.find_by_name(deslug)
  end
end
