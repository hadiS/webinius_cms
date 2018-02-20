class AddIndexToHstore < ActiveRecord::Migration[5.1]
  def up
    execute "CREATE INDEX webinius_cms_pages_gin_properties ON webinius_cms_pages USING GIN(properties)"
  end

  def down
    execute "DROP INDEX webinius_cms_pages_gin_properties"
  end
end
