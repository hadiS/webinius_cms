module WebiniusCms
  class List < ApplicationRecord

    has_many :list_items, class_name: 'WebiniusCms::ListItem', foreign_key: :webinius_cms_list_id

    belongs_to :page, class_name: 'WebiniusCms::Page', foreign_key: :webinius_cms_page_id

    validates :name, uniqueness: true

  end
end
