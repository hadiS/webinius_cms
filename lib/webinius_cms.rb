require "webinius_cms/engine"
require 'bootstrap-sass'
require 'jquery-rails'
require 'ancestry'
require 'acts_as_list'
require 'turbolinks'
require 'font-awesome-sass'
require 'carrierwave'
require 'mini_magick'
require 'will_paginate'
require 'will_paginate-bootstrap'

module WebiniusCms

  class << self
    mattr_accessor :picture_size_thumb
    mattr_accessor :picture_size_big
    self.picture_size_thumb = 500
    self.picture_size_big = 1900

    mattr_accessor :image_size_thumb
    mattr_accessor :image_size_big
    self.image_size_thumb = 300
    self.image_size_big = 900
  end

  def self.setup(&block)
    yield self
  end
end
