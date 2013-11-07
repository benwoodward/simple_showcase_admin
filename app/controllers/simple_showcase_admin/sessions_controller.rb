module SimpleShowcaseAdmin
  class SessionsController < SimpleShowcaseAdmin::ApplicationController
    skip_before_filter :require_login

    def new
      logout
    end

    def create
      user = login(params[:email], params[:password], params[:remember_me])
      if user
        redirect_back_or_to root_path, :notice => "Logged in as #{ current_user.email }"
      else
        redirect_to login_path, :notice => 'Email or password was invalid'
      end
    end

    def destroy
      logout
      if !current_user
        redirect_to login_path, :notice => 'Logged out!'
      end
    end
  end
end
