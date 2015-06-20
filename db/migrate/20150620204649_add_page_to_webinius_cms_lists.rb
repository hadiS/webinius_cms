class AddPageToWebiniusCmsLists < ActiveRecord::Migration
  def change
    add_reference :webinius_cms_lists, :webinius_cms_page, index: true, foreign_key: true
  end
end
