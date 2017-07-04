class DrugsController < ApplicationController
  

  def index
    if (params[:category])
      category = Category.find(params[:category])
      @drugs = category.drugs.order(rank: :desc).page(params[:page])
      
    else
      @drugs = Drug.order(rank: :desc).page(params[:page])
    end
    
    respond_to do |format|
      format.json { render json: @drugs }
    end
  end

  def search
    term = params[:term] || nil
    drugs = []
    drugs = Drug.query(term) if term
    render json: drugs.order(rank: :desc).limit(5)
  end

  def show
    @drug = Drug.find(params[:id])

    respond_to do |format|
      format.json { render json: @drug.to_json(include: {:ingredients => { include: :drugs }}) }
    end
  end

  def update
    @drug = Drug.find(params[:id])

    if @drug.update_attributes(drugs_params)
      respond_to do |format|
        format.json { render json: @drug }
      end
    end
  end


  private
    def drugs_params
      params.require(:drug).permit(:rank)
    end
  
end
