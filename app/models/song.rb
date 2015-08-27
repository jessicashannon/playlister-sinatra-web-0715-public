class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.gsub(" ","-").downcase
  end

  def self.find_by_slug(slug)
    deslug = slug.split("-").map{|i|i.capitalize}.join(" ")
    Song.find_by_name(deslug)
  end
end
