class AddPictureToWebiniusCmsPage < ActiveRecord::Migration[5.1]
  def change
    add_column :webinius_cms_pages, :picture, :string
  end
end
