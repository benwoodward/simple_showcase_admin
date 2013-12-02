module SimpleShowcaseAdmin
  class SettingsController < SimpleShowcaseAdmin::ApplicationController
    def index
      @settings = Setting.all
    end

    def update
      params[:settings].each_pair do |setting, value|
        Setting.send("#{setting}=", value)
      end

      redirect_to [:admin, :settings], :notice => 'Settings updated' # Redirect to the settings index
    end
  end
end

