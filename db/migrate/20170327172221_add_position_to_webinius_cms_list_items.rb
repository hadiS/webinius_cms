class AddPositionToWebiniusCmsListItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :webinius_cms_list_items, :position, :integer
  end
end