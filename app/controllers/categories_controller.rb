class CategoriesController < ApplicationController

  def index
  	@categories = Category.order(rank: :desc).page(params[:page])

  	respond_to do |format|
      format.html
  	  format.json { render json: @categories }
  	end
  end

  def show
  	@category = Category.find(params[:id])

  	respond_to do |format|
      format.html
  	  format.json { render json: @category.to_json( include: :drugs ) }
  	end
  end

  def landCats
    @landCats = Category.find(3,25,24,335)

    render json: @landCats #.to_json(include: :drugs)
  end

  def update
    @category = Category.find(params[:id])

      if @category.update_attributes(category_params)
          respond_to do |format|
          format.json { render json: @category }
      end
    end
  end

  private 
  def category_params
    params.require(:category).permit(:rank)
  end
end
