class Book < ActiveRecord::Base
  attr_accessor :title2, :image_url, :url

  def initialize(title2, image_url, url)
    @title2 = title2
    @image_url = image_url
    @url = url
  end
end
