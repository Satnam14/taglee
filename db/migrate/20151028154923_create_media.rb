class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :url, null: false
      t.string :caption
      t.string :tag_time
      t.string :poster
      t.string :link
      t.string :poster_profile
      t.integer :album_id, null: false

      t.timestamps null: false
    end
  end
end
