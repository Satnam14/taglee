class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :tag, null: false
      t.string :name, null: false
      t.string :start, null: false
      t.string :finish, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
