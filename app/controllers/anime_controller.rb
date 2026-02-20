class AnimeController < ApplicationController
  before_action :set_status_filter

  def index
    @status = params[:status] || "COMPLETED"
    @anime_list = AnimeEntry.where(list_status: @status, visible: true)
                        .order(:title)
                        .page(params[:page]).per(24)
  end

  private

  def set_status_filter
    @available_statuses = ["COMPLETED", "DROPPED", "PLANNING", "CURRENT", "PAUSED", "REPEATING"]
  end
end