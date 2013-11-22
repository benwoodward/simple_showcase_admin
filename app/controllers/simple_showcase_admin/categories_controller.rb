module SimpleShowcaseAdmin
  class CategoriesController < SimpleShowcaseAdmin::ApplicationController
    def index
      @categories = SimpleShowcaseAdmin::Category.rank(:row_order).page(params[:page]).per(10)
    end

    def new
      @category = SimpleShowcaseAdmin::Category.new
    end

    def edit
      @category = SimpleShowcaseAdmin::Category.find(params[:id])
    end

    def show
      @category = SimpleShowcaseAdmin::Category.find(params[:id])
      @items = Item.where(category_id: @category.id).rank(:row_order).page(params[:page]).per(10)
    end

    def create
      @category = SimpleShowcaseAdmin::Category.new(params[:category])
      if @category.save
        redirect_to [ @category], notice: 'Successfully created new category'
      else
        render :new
      end
    end

    def update
      @category = SimpleShowcaseAdmin::Category.find(params[:id])
      if @category.update_attributes(params[:category])
        redirect_to category_path(@category), notice: 'Successfully updated category'
      else
        render :edit
      end
    end

    def destroy
      @category = SimpleShowcaseAdmin::Category.find(params[:id])
      @category.destroy
      redirect_to categories_path
    end

    def sort
      @category = SimpleShowcaseAdmin::Category.find(params[:id])
      @category.row_order_position = params[:row_order_position]
      @category.save!

      render nothing: true
    end
  end
end
