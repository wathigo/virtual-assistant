class CategoriesController < ApplicationController
  def new; end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Something went wrong'
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    if @category
      redirect_back(fallback_location: root_path) if @category.destroy
    else
      flash[:alert] = 'Ooops, Record was not found'
    end
  end

  def show
    @category = @category = Category.find_by_id(params[:format])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
