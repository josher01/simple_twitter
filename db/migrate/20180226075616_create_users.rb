class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :avatar
      t.text :introduction
      t.string :role
      t.integer :follower_count
      t.integer :likes_count

      t.timestamps
    end
  end
end
