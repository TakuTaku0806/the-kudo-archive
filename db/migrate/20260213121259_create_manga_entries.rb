class CreateMangaEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :manga_entries do |t|
      t.integer :anilist_id
      t.string :title
      t.string :cover_image
      t.string :format
      t.integer :chapters
      t.integer :volumes
      t.float :mean_score
      t.string :media_status
      t.string :list_status
      t.integer :progress
      t.integer :score
      t.boolean :visible
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :manga_entries, [:anilist_id, :user_id], unique: true
  end
end
