class AddPictureToWebiniusCmsPage < ActiveRecord::Migration
  def change
    add_column :webinius_cms_pages, :picture, :string
  end
end
