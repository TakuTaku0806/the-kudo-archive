SitemapGenerator::Sitemap.default_host = "https://the-kudo-archive.onrender.com"
SitemapGenerator::Sitemap.public_path = 'public/'

SitemapGenerator::Sitemap.create do
  Post.find_each do |post|
    add post_path(post), lastmod: post.updated_at
  end
end