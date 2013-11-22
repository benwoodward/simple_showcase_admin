require 'friendly_id'
require 'redcarpet'

module SimpleShowcaseAdmin
  class Page < ActiveRecord::Base
    attr_accessible :text, :rendered_text, :title, :slug, :row_order_position

    extend FriendlyId
    friendly_id :title, use: :slugged

    include RankedModel
    ranks :row_order

    validates_presence_of :title

    before_save :render_body

    private

    def render_body
      renderer = Redcarpet::Render::HTML.new
      extensions = {filter_html: false, safe_links_only: true, hard_wrap: true, autolink: true, no_intra_emphasis: true}
      redcarpet = Redcarpet::Markdown.new(renderer, extensions)
      self.rendered_text = redcarpet.render self.text
    end
  end
end

