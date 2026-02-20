namespace :manga do
  desc "Import Manga from Anilist"
  task import: :environment do
    admin = User.find_by(admin: true)
    unless admin
      puts "❌ No admin. First create account and set admin=true."
      return
    end

    username = ENV["ANILIST_USERNAME"] || admin.anilist_username || "TakuTaku08"
    puts "Fetching Manga for #{username}..."

    data = AnilistService.fetch_user_manga_list(username)
    unless data
      puts "❌ Error fetching data from Anilist"
      return
    end

    lists = data.dig("data", "MediaListCollection", "lists")
    return unless lists

    lists.each do |list|
      list["entries"].each do |entry|
        media = entry["media"]

        MangaEntry.find_or_initialize_by(
          anilist_id: media["id"],
          user_id: admin.id
        ) do |m|
          m.title = media.dig("title", "romaji") || media.dig("title", "english")
          m.cover_image = media.dig("coverImage", "large")   # poprawione
          m.format = media["format"]
          m.chapters = media["chapters"]
          m.volumes = media["volumes"]
          m.mean_score = media["meanScore"]&.to_f
          m.media_status = media["status"]
          m.list_status = entry["status"]
          m.progress = entry["progress"]
          m.score = entry["score"]
          m.visible = true
          m.save!
        end
      end
    end

    puts "✅ Import completed! Imported #{MangaEntry.count} entries."
  end
end