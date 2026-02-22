# Przykład w config/sitemap.rb
Post.find_each do |post|
  add post_path(post), lastmod: post.updated_at
end