class CategoriesController < ApplicationController
  def new; end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Somethig went wrong'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
