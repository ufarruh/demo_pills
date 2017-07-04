class UsersController < ApplicationController

  def favorites
    @favorites = current_user.favorites if current_user

    respond_to do |format|
      format.json { render json: @favorites }
    end
  end
  
  def favorite
    drug = Drug.find(params["user"]["drug_id"])
    current_user.favorites << drug if current_user

    head :no_content
  end

  def unfavorite
    drug = Drug.find(params["user"]["drug_id"])

    current_user.favorites.delete(drug) if current_user
    head :no_content
  end
end
