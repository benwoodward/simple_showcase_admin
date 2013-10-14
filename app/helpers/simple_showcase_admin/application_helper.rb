module SimpleShowcaseAdmin
  module ApplicationHelper
    def featured_photo_exists
      Photo.where(featured: true).count > 0
    end

    def markdown(text)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:filter_html => true, :safe_links_only => true, :hard_wrap => true), autolink: true, no_intra_emphasis: true)
      markdown.render(text).html_safe
    end
  end
end
