class AddTokenRefreshTokenExpiresAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :access_token, :string
    add_column :users, :refresh_token, :string
    add_column :users, :expires_at, :datetime
    add_index :users, :uid
    add_index :users, [:uid, :refresh_token, :expires_at]
  end
end
