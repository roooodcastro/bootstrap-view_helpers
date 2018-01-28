module ApplicationHelper
  def render_raw(partial: '')
    parts = partial.split('/')
    parts[-1] = "_#{parts[-1]}.html.erb"
    File.read("app/views/#{parts.join('/')}").gsub("\n", '<br/>').html_safe
  end
end
