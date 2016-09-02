module WebiniusCms
  class Image < ApplicationRecord
    belongs_to :imageable, class_name: 'WebiniusCms::Page', foreign_key: :webinius_cms_page_id, polymorphic: true

    mount_uploader :image, ImageUploader
  end
end
