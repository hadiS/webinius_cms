class CreateWebiniusCmsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :webinius_cms_users do |t|
      t.string :password_digest
      t.string :username
      t.string :name

      t.timestamps
    end
  end
end
