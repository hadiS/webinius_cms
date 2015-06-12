class CreateWebiniusCmsLists < ActiveRecord::Migration
  def change
    create_table :webinius_cms_lists do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
