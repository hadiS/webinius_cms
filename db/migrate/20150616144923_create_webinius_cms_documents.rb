class CreateWebiniusCmsDocuments < ActiveRecord::Migration
  def change
    create_table :webinius_cms_documents do |t|
      t.references :docable, polymorphic: true, index: true
      t.string :name
      t.string :document

      t.timestamps null: false
    end
  end
end
