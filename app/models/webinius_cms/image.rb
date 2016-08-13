module WebiniusCms
  class Image < ApplicationRecord
    belongs_to :page, class_name: 'WebiniusCms::Page', foreign_key: :webinius_cms_page_id

    mount_uploader :image, ImageUploader
  end
end
