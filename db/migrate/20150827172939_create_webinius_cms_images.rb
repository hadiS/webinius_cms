class CreateWebiniusCmsImages < ActiveRecord::Migration
  def change
    create_table :webinius_cms_images do |t|
      t.string :title
      t.text :description
      t.references :webinius_cms_page, index: true
      t.string :image

      t.timestamps null: false
    end

    add_foreign_key :webinius_cms_images, :webinius_cms_pages, on_delete: :cascade
  end
end
