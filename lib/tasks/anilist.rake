namespace :anilist do
  desc "Import anime list from Anilist"
  task import: :environment do
    admin = User.find_by(admin: true)
    unless admin
      puts "❌ Brak administratora. Najpierw utwórz konto i ustaw admin=true."
      next
    end

    username = ENV["ANILIST_USERNAME"] || admin.anilist_username || "TakuTaku08"
    puts "Fetching anime list for #{username}..."

    data = AnilistService.fetch_user_anime_list(username)
    unless data
      puts "❌ Błąd pobierania danych z Anilist."
      next
    end

    lists = data.dig("data", "MediaListCollection", "lists")
    lists.each do |list|
      list["entries"].each do |entry|
        media = entry["media"]

        AnimeEntry.find_or_initialize_by(
          anilist_id: media["id"],
          user_id: admin.id
        ) do |a|
          a.title = media.dig("title", "romaji") || media.dig("title", "english")
          a.cover_image = media.dig("coverImage", "large")
          a.format = media["format"]
          a.episodes = media["episodes"]
          a.mean_score = media["meanScore"]&.to_f
          a.media_status = media["status"]
          a.list_status = entry["status"]
          a.progress = entry["progress"]
          a.score = entry["score"]
          a.visible = true
          a.save!
        end
      end
    end

    puts "✅ Import zakończony! Zaimportowano #{AnimeEntry.count} pozycji."
  end
  desc "Update progress for all anime entries from Anilist"
  task update_progress: :environment do
    admin = User.find_by(admin: true)
    unless admin
      puts "❌️No admin permissions"
      next
    end
    
    username = admin.anilist_username || "TakuTaku08"
    data = AnilistService.fetch_user_anime_list(username)
    unless data
      puts "❌️Error fetching data"
      next
    end

    lists = data.dig("data", "MediaListCollection", "lists")
    lists.each do |list|
      list["entries"].each do |entry|
        media = entry["media"]
        anime = AnimeEntry.find_by(anilist_id: media["id"])
        if anime
          anime.update(progress: entry["progress"])
          puts "Updated"
        end
      end
    end
    puts "✅️Progress of all anime has been updated!" 
  end   
end