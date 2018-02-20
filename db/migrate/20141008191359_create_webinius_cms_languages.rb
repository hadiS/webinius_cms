class CreateWebiniusCmsLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :webinius_cms_languages do |t|
      t.string :name
      t.string :code
      t.boolean :status
      t.boolean :default

      t.timestamps
    end
  end
end
