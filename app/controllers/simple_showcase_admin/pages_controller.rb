module SimpleShowcaseAdmin
  class PagesController < SimpleShowcaseAdmin::ApplicationController
    def index
      @pages = SimpleShowcaseAdmin::Page.rank(:row_order).page(params[:page]).per(10)
    end

    def new
      @page = SimpleShowcaseAdmin::Page.new
    end

    def edit
      @page = SimpleShowcaseAdmin::Page.find(params[:id])
    end

    def show
      @page = SimpleShowcaseAdmin::Page.find(params[:id])
    end

    def create
      @page = SimpleShowcaseAdmin::Page.new(params[:page])
      if @page.save
        redirect_to [ @page], notice: 'Successfully created new page'
      else
        render :new
      end
    end

    def update
      @page = SimpleShowcaseAdmin::Page.find(params[:id])
      if @page.update_attributes(params[:page])
        redirect_to page_path(@page), notice: 'Successfully updated page'
      else
        render :edit
      end
    end

    def destroy
      @page = SimpleShowcaseAdmin::Page.find(params[:id])
      @page.destroy
      redirect_to pages_path
    end

    def sort
      @page = SimpleShowcaseAdmin::Page.find(params[:id])

      @page.row_order_position = params[:row_order_position]
      @page.save!

      render nothing: true
    end
  end
end
