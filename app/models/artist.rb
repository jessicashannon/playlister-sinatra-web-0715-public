class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def name=(new_name)
    super
    update_slug
  end

  private
  def update_slug
    self.slug = self.name.downcase.scan(/\w+/).join('-')
  end

  # def slug
  #   name.gsub(" ","-").downcase
  # end
  #
  # def self.find_by_slug(slug)
  #   deslug = slug.split("-").map{|i|i.capitalize}.join(" ")
  #   Artist.find_by_name(deslug)
  end
end
