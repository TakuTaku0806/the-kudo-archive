module ApplicationHelper
  # 1. This adds the IDs to the actual content
  def add_ids_to_headings(content)
    return "" if content.blank?
    
    # This regex finds <h2> tags and adds a parameterized ID based on the text
    content.gsub(/<h2>(.*?)<\/h2>/) do |match|
      text = $1
      id = text.parameterize # Turns "My Review" into "my-review"
      "<h2 id='#{id}' class='scroll-mt-20'>#{text}</h2>"
    end.html_safe
  end

  # 2. This creates the Sidebar Links
  def toc_from_content(content)
    return "" if content.blank?
    
    headings = content.scan(/<h2>(.*?)<\/h2>/).flatten
    return content_tag(:p, "No sections found", class: "text-gray-400 italic") if headings.empty?

    content_tag(:ul, class: "space-y-2") do
      headings.map do |text|
        id = text.parameterize # MUST match the one above
        content_tag(:li) do
          link_to text, "##{id}", class: "text-gray-600 hover:text-indigo-600 transition-colors"
        end
      end.join.html_safe
    end
  end
end