class CreateMedia < ActiveRecord::Migration[7.1] # or your version
  def change
    # Add this line:
#    drop_table :media if table_exists?(:media)

    create_table :media do |t|
      t.string :title
      t.string :list_status
      t.boolean :visible
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end