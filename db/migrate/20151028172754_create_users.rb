class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :username, null: false
      t.string :session_token, null: false
      t.string :full_name
      t.string :profile_pic

      t.timestamps null: false
    end
  end
end
