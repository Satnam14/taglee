class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :url, null: false
      t.string :caption
      t.string :created_time
      t.string :poster
      t.string :poster_profile

      t.timestamps null: false
    end
  end
end
