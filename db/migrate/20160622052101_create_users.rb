class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid, :index, unique: true
      t.string :name
      t.string :email
      t.string :spotify_url
      t.string :image_url

      t.timestamps null: false
    end
  end
end
