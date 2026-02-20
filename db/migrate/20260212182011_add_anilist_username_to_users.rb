class AddAnilistUsernameToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :anilist_username, :string
  end
end
