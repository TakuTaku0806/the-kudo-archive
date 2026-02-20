class CreateAnimes < ActiveRecord::Migration[8.1]
  def change
    create_table :animes do |t|
      t.string :title
      t.string :list_status
      t.boolean :visible
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
