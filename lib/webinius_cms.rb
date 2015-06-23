require "webinius_cms/engine"
require 'bootstrap-sass'
require 'jquery-rails'
require 'ancestry'
require 'acts_as_list'
require 'turbolinks'
require 'font-awesome-sass'
require 'carrierwave'
require 'mini_magick'
require 'tinymce-rails'

module WebiniusCms

  class << self
    mattr_accessor :picture_size_thumb
    mattr_accessor :picture_size_big
    self.picture_size_thumb = 500
    self.picture_size_big = 1900
  end

  def self.setup(&block)
    yield self
  end
end
