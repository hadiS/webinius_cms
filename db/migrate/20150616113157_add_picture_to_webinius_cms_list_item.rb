class AddPictureToWebiniusCmsListItem < ActiveRecord::Migration
  def change
    add_column :webinius_cms_list_items, :picture, :string
  end
end
