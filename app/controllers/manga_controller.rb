class MangaController < ApplicationController
  before_action :set_status_filter

  def index
    @status = params[:status] || "COMPLETED"
    @manga_list = MangaEntry.where(list_status: @status, visible: true)
                        .order(:title)
                        .page(params[:page]).per(24)
  end

  private

  def set_status_filter
    @available_statuses = ["COMPLETED", "DROPPED", "PLANNING", "CURRENT", "PAUSED", "REPEATING"]
  end
end