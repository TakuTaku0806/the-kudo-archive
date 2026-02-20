class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts_count = Post.count
    @comments_count = Comment.count
    @anime_entries_count = AnimeEntry.count
    @manga_entries_count = MangaEntry.count
    @subscribers_count = Subscriber.count
  end
end