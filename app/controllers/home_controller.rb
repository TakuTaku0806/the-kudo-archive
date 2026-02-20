require 'net/http'
require 'json'

class HomeController < ApplicationController
  def index
    @featured_post = Post.order(created_at: :desc).first
    # We use offset(1) to ensure the featured post isn't repeated in the "Latest Reviews" grid
    @latest_posts = Post.order(created_at: :desc).offset(1).limit(3)

    # Fetch AniList activity (Replace 'Your_Anilist_Username' with your actual username)
    @anilist_activities = fetch_anilist_activity('TakuTaku08')
  end

  private

  def fetch_anilist_activity(username)
    uri = URI('https://graphql.anilist.co')
    query = <<~GRAPHQL
      query ($username: String) {
        Page(page: 1, perPage: 5) {
          activities(userName: $username, type: ANIME_LIST, sort: ID_DESC) {
            ... on ListActivity {
              id
              status
              progress
              media {
                title { romaji }
                coverImage { medium }
              }
              createdAt
            }
          }
        }
      }
    GRAPHQL

    response = Net::HTTP.post(uri, { query: query, variables: { username: username } }.to_json, "Content-Type" => "application/json")
    JSON.parse(response.body).dig('data', 'Page', 'activities') || []
  rescue
    [] # Return empty array if the API call fails
  end
end