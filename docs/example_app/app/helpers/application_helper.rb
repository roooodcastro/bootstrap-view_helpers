module ApplicationHelper
  def render_raw(partial: '')
    parts = partial.split('/')
    parts[-1] = "_#{parts[-1]}.html.erb"
    File.read("app/views/#{controller_path}/#{parts.join('/')}").gsub('//', '/')
  end

  def render_code(partial: '')
    code = render_raw(partial: partial)
    content_tag(:code, CodeRay.scan(code, :erb).div(css: :class).html_safe)
  end

  def render_example_description(example)
    capture do
      concat(content_tag(:h3, t(".#{example}"), id: example))
      concat(content_tag(:p, t(".#{example}_html")))
    end
  end

  def render_example(partial: '')
    capture do
      concat(bs_card(body: true, class: :example) do
        concat render(partial: partial)
      end)
      concat render_code(partial: partial)
    end
  end
end
