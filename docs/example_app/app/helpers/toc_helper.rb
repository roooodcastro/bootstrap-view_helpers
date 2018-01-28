module TocHelper
  def toc_entry(example)
    content_tag(:li, class: 'toc-entry') do
      concat link_to(t(".#{example}"), "##{example}")
      concat(content_tag(:ul) { yield }) if block_given?
    end
  end
end
