class PharmaciesController < ApplicationController
   
  def index
  	@pharmacies = Pharmacy.all

  	respond_to do |format|
  	  format.json { render json: @pharmacies }
  	end
  end


  def show
  	@pharmacy = Pharmacy.find(params[:user_id]).pharmacy

  	respond_to do |format|
  	  format.json { render json: @pharmacy }
  	end
  end

  def create
    
    @pharmacy = Pharmacy.new(pharmacy_params)

    if @pharmacy.save!
      respond_to do |format|
        format.json { render json: @pharmacy }
      end
    end
  end


  def pharmacy_drugs
    @pharmacy_drugs = current_user.pharmacy.drugs if current_user

    respond_to do |format|
      format.json { render json: @pharmacy_drugs.to_json(include: :pharmacy_drugs) }
    end
  end

  def add
    @pharmacy = current_user.pharmacy.pharmacy_drugs
    @pharmacy.create(
                      drug_id: params[:drug_id], 
                      price: params[:price].to_i, 
                      exp_date: params[:exp_date]
                    )

    respond_to do |format| 
      format.json { render json: @pharmacy }
    end
  end
  
  
  def remove
    @pharmacy = current_user.pharmacy
    drug = PharmacyDrug.find(params["drug_id"].to_i)
    @pharmacy.pharmacy_drugs.find(drug).destroy

    head :no_content

  end

  private

    def pharmacy_params
      params.require(:pharmacy).permit(:name, :work_hours, :phone_number, :region, :address)
    end


end
