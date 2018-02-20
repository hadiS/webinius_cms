class AddPictureToWebiniusCmsListItem < ActiveRecord::Migration[5.1]
  def change
    add_column :webinius_cms_list_items, :picture, :string
  end
end
