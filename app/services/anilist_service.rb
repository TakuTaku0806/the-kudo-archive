class AnilistService
  include HTTParty
  base_uri "https://graphql.anilist.co"

  # Anime
  def self.fetch_user_anime_list(username)
    query = <<~GRAPHQL
      query ($userName: String, $type: MediaType) {
        MediaListCollection(userName: $userName, type: $type) {
          lists {
            name
            entries {
              id
              status
              score
              progress
              media {
                id
                title {
                  romaji
                  english
                  native
                }
                coverImage {
                  large
                  medium
                }
                format
                episodes
                chapters
                volumes
                meanScore
                averageScore
                status
                startDate {
                  year
                  month
                  day
                }
                endDate {
                  year
                  month
                  day
                }
                genres
                tags {
                  name
                  rank
                }
                description
                siteUrl
              }
            }
          }
        }
      }
    GRAPHQL

    variables = {
      userName: username,
      type: "ANIME"
    }

    make_request(query, variables)
  end

  # Manga
  def self.fetch_user_manga_list(username)
    query = <<~GRAPHQL
      query ($userName: String, $type: MediaType) {
        MediaListCollection(userName: $userName, type: $type) {
          lists {
            name
            entries {
              id
              status
              score
              progress
              media {
                id
                title {
                  romaji
                  english
                  native
                }
                coverImage {
                  large
                  medium
                }
                format
                chapters
                volumes
                meanScore
                averageScore
                status
                startDate {
                  year
                  month
                  day
                }
                endDate {
                  year
                  month
                  day
                }
                genres
                tags {
                  name
                  rank
                }
                description
                siteUrl
              }
            }
          }
        }
      }
    GRAPHQL

    variables = {
      userName: username,
      type: "MANGA"
    }

    make_request(query, variables)
  end

  private

  def self.make_request(query, variables)
    response = post("/",
      body: { query: query, variables: variables }.to_json,
      headers: { "Content-Type" => "application/json" }
    )

    if response.success?
      response.parsed_response
    else
      Rails.logger.error("Anilist API error: #{response.body}")
      nil
    end
  end
end