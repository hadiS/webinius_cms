module WebiniusCms
  class ListItem < ApplicationRecord

    acts_as_list scope: :webinius_cms_list_id

    belongs_to :list, class_name: 'WebiniusCms::List', foreign_key: :webinius_cms_list_id

    has_many :documents, as: :docable, dependent: :destroy
    accepts_nested_attributes_for :documents, allow_destroy: true, reject_if: proc { |attributes| attributes['document'].blank? && attributes['document_cache'].blank? }

    has_many :images, as: :imageable, dependent: :destroy
    accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? && attributes['image_cache'].blank? && attributes['id'].blank? }

    validate :validate_title

    before_validation :generate_slug

    scope :online, -> { where(status: true) }

    mount_uploader :picture, PictureUploader

    Language.all.each do |lang|
      ["#{lang.code}_title", "#{lang.code}_content", "#{lang.code}_meta_description", "#{lang.code}_slug", "#{lang.code}_description"].each do |key|
        # scope "has_#{key}", lambda { |value| where("properties @> hstore(?, ?)", key, value) }

        define_method(key) do
          properties && properties[key]
        end

        define_method("#{key}=") do |value|
          self.properties = (properties || {}).merge(key => value)
        end
      end
    end

    def validate_title
      Language.online.each do |lang|
        if send(:"#{lang.code}_title").blank?
          errors.add(:"#{lang.code}_title", "can't be blank")
        end
      end
    end

    def generate_slug
      Language.all.each do |lang|
        self.properties = (properties || {}).merge("#{lang.code}_slug" => [id, send(:"#{lang.code}_title").parameterize].join('-'))
      end
    end

    def method_missing(method, *args, &block)
      if method.to_s =~ /.*_(title|content|meta_description|slug|description)$/
        # scope "has_#{key}", lambda { |value| where("properties @> hstore(?, ?)", key, value) }
        Page.instance_eval do
          define_method(method.to_s) do
            properties && properties[method.to_s]
          end

          define_method("#{method.to_s}=") do |value|
            self.properties = (properties || {}).merge(method.to_s => value)
          end
        end
        send(method, *args)
      else
        super
      end
    end

  end
end
