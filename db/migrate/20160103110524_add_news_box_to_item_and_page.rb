class AddNewsBoxToItemAndPage < ActiveRecord::Migration
  def change
    add_column :webinius_cms_pages, :is_news, :boolean
    add_column :webinius_cms_list_items, :is_news, :boolean
  end
end
