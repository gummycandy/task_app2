class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail_address
      t.string :password_digest
      t.text :introduction
      t.string :image_name

      t.timestamps
    end
  end
end
