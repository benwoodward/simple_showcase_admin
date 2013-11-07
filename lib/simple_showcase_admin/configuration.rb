module SimpleShowcaseAdmin
  class Configuration

    attr_accessor :featured_image

  end

  def self.config(&block)
    yield(Rails.application.config.simple_showcase_admin)
  end
end
