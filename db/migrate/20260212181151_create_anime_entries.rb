class CreateAnimeEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :anime_entries do |t|
      t.integer :anilist_id
      t.string :title
      t.string :cover_image
      t.string :format
      t.integer :episodes
      t.float :mean_score
      t.string :media_status
      t.string :list_status
      t.integer :progress
      t.integer :score
      t.boolean :visible
      t.references :user, foreign_key: true

      t.timestamps
    end

    # 👇 TO MUSI BYĆ POZA BLOKIEM create_table
    add_index :anime_entries, [:anilist_id, :user_id], unique: true
  end
end