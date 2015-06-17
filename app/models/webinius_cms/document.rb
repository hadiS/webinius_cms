module WebiniusCms
  class Document < ActiveRecord::Base
    belongs_to :docable, polymorphic: true

    mount_uploader :document, DocUploader

    validates :name, presence: true, if: 'document.present?'
  end
end
