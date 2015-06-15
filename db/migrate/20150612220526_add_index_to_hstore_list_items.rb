class AddIndexToHstoreListItems < ActiveRecord::Migration
  def up
    execute "CREATE INDEX webinius_cms_list_items_gin_properties ON webinius_cms_list_items USING GIN(properties)"
  end

  def down
    execute "DROP INDEX webinius_cms_list_items_gin_properties"
  end
end
