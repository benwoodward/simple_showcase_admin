module SimpleShowcaseAdmin
  class DetailsController < ApplicationController
    def edit
      @user = SimpleShowcaseAdmin::User.find(params[:id])
    end

    def update
      @user = SimpleShowcaseAdmin::User.find(params[:id])
      if @user.update_attributes(params[:user])
        redirect_to detail_path(@user), :notice => "You have successfully updated your personal details"
      else
        render :edit
      end
    end

    def show
      @user = SimpleShowcaseAdmin::User.find(params[:id])
    end
  end
end
