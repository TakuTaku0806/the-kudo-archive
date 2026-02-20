class Admin::AnimeEntriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @anime_entries = AnimeEntry.order(:title)
  end

  def set_featured
    # Najpierw usuń flagę ze wszystkich
    AnimeEntry.update_all(featured_in_sidebar: false)
    # Ustaw flagę dla wybranego anime
    AnimeEntry.find(params[:id]).update(featured_in_sidebar: true)
    redirect_to admin_anime_entries_path, notice: "Selected anime is now displayed in the sidebar."
  end
end