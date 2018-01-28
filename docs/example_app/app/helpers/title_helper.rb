module TitleHelper
  def title(title_text, subtitle = nil)
    content_for(:title) { title_text }
    content_tag(:h1, class: 'my-4') do
      concat title_text
      if subtitle
        concat content_tag(:small, subtitle, class: 'text-muted d-block')
      end
      concat content_tag(:hr, nil, class: 'my-2')
    end
  end
end
