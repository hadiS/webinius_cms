class CreateWebiniusCmsPages < ActiveRecord::Migration[5.1]
  def change
    create_table :webinius_cms_pages do |t|
      t.boolean :status
      t.string :ancestry
      t.string :kind
      t.integer :position
      t.string :slug
      
      t.hstore :properties

      t.timestamps
    end
    add_index :webinius_cms_pages, :ancestry
  end
end
