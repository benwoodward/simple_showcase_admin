module SimpleShowcaseAdmin
  class Setting < RailsSettings::CachedSettings
    attr_accessible :var
  end
end
