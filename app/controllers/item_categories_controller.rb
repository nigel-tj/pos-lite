class ItemCategoriesController < ApplicationController
  before_action :set_item_category, only: [:show, :edit, :update, :destroy]

  def index
    @item_categories = ItemCategory.paginate(page: params[:page], per_page: 20)
  end

  def new
    @item_category = ItemCategory.new
  end

  def show
  end

  def edit
  end

  def create
    @item_category = ItemCategory.new(item_category_params)

    respond_to do |format|
      if @item_category.save
        format.html { redirect_to @item_category, notice: 'Item category was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @item_category.update(item_category_params)
        format.html { redirect_to @item_category, notice: 'Item category was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @item_category.destroy
    respond_to do |format|
      format.html { redirect_to item_categories_url }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item_category
    @item_category = ItemCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_category_params
    params.require(:item_category).permit(:name, :description)
  end
end
