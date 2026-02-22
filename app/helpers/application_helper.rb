module ApplicationHelper
  # Generuje ID dla nagłówków h2 w treści
  def add_ids_to_headings(content)
    return "" if content.blank?
    
    content.gsub(/<h2>(.*?)<\/h2>/i) do
      text = $1
      id = text.parameterize
      "<h2 id='#{id}' class='scroll-mt-20'>#{text}</h2>"
    end.html_safe
  end

  # Tworzy spis treści (Sidebar)
  def toc_from_content(content)
    return "" if content.blank?
    
    headings = content.scan(/<h2>(.*?)<\/h2>/i).flatten
    return content_tag(:p, "No sections found", class: "text-gray-400 italic") if headings.empty?

    content_tag(:ul, class: "space-y-2") do
      headings.map do |text|
        id = text.parameterize
        content_tag(:li) do
          link_to text, "##{id}", class: "text-gray-600 hover:text-indigo-600 transition-colors"
        end
      end.join.html_safe
    end
  end
end
