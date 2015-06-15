module WebiniusCms
  class List < ActiveRecord::Base

    has_many :list_items, class_name: 'WebiniusCms::ListItem', foreign_key: :webinius_cms_list_id

    validates :name, uniqueness: true

  end
end
