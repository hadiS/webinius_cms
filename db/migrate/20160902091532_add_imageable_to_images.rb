class AddImageableToImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :webinius_cms_images, :imageable, polymorphic: true, index: true
    remove_column :webinius_cms_images, :webinius_cms_page_id
  end
end
