class AddFeaturedInSidebarToAnimeEntries < ActiveRecord::Migration[8.1]
  def change
    add_column :anime_entries, :featured_in_sidebar, :boolean, default: false
    add_index :anime_entries, :featured_in_sidebar  # opcjonalnie, dla szybszego wyszukiwania
  end
end