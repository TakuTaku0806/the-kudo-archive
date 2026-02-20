module PostsHelper
  # Creates ID's for headings
  def add_ids_to_headings(content)
    content.gsub(/<h2>(.*?)<\/h2>/i) do
      heading = Regexp.last_match(1)
      id = heading.parameterize
      "<h2 id=\"#{id}\">#{heading}</h2>"
    end.html_safe
  end

  # Table of contents
  def toc_from_content(content)
    headings = content.scan(/<h2>(.*?)<\/h2>/i).flatten
    return nil if headings.empty?

    content_tag :ul, class: "space-y-2 text-sm" do
      headings.map do |heading|
        link = "##{heading.parameterize}"
        content_tag :li do
          link_to heading, link, class: "text-indigo-600 hover:underline", data: {turbo: false}
        end
      end.join.html_safe
    end
  end
end