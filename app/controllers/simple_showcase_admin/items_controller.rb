module SimpleShowcaseAdmin
  class ItemsController < SimpleShowcaseAdmin::ApplicationController
    def new
      @item = SimpleShowcaseAdmin::Item.new
      @photos = @item.photos.new
    end

    def edit
      @item = SimpleShowcaseAdmin::Item.find(params[:id])
      @category = SimpleShowcaseAdmin::Category.find(params[:category_id])
      @photos = @item.photos.blank? ? @item.photos.new : @item.photos
    end

    def show
      @item = SimpleShowcaseAdmin::Item.find(params[:id])
      @category = SimpleShowcaseAdmin::Category.find(params[:category_id])
      @photos = @item.photos
    end

    def create
      @category = SimpleShowcaseAdmin::Category.find(params[:category_id])
      @item = @category.items.new(params[:item])
      if @item.save
        redirect_to category_item_path(@category, @item), notice: "Successful created #{@item.title.downcase}"
      else
        @photos = @item.photos.blank? ? @item.photos.new : @item.photos
        render :new
      end
    end

    def update
      @category = SimpleShowcaseAdmin::Category.find(params[:category_id])
      @item = SimpleShowcaseAdmin::Item.find(params[:id])
      if @item.update_attributes!(params[:item])
        redirect_to category_item_path(@category, @item)
      else
        @photos = @item.photos.blank? ? @item.photos.new : @item.photos
        render :edit
      end
    end

    def destroy
      @item = SimpleShowcaseAdmin::Item.find(params[:id])
      @item.destroy
      redirect_to category_path(params[:category_id]), notice: "Successfully deleted #{@item.title}"
    end
  end
end
