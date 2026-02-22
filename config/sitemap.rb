SitemapGenerator::Sitemap.default_host = "https://the-kudo-archive.onrender.com"

SitemapGenerator::Sitemap.create do
  # Tutaj Twoje ścieżki (add posts_path, itp.)
  add posts_path, priority: 0.9, changefreq: 'daily'
  
  Post.find_each do |post|
    add post_path(post), lastmod: post.updated_at
  end
end