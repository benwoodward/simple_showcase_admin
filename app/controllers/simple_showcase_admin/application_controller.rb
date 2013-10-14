module SimpleShowcaseAdmin
  class ApplicationController < ActionController::Base
    protect_from_forgery
    before_filter :require_login

    def not_authenticated
      redirect_to login_path, notice: 'Please login to access the administration area'
    end
  end
end
