module ApplicationHelper
  def render_raw(partial: '')
    parts = partial.split('/')
    parts[-1] = "_#{parts[-1]}.html.erb"
    File.read("app/views/#{parts.join('/')}")
  end

  def render_code(partial: '')
    code = render_raw(partial: partial)
    content_tag(:code, CodeRay.scan(code, :erb).div(css: :class).html_safe)
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
