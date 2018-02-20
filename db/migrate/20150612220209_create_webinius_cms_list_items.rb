class CreateWebiniusCmsListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :webinius_cms_list_items do |t|
      t.boolean :status
      t.hstore :properties
      t.references :webinius_cms_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
