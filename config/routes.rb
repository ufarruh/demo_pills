Rails.application.routes.draw do

  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

    
  root 'static_pages#index'

  scope :api do
    scope :v1 do
      resources :drugs, except: [:destroy] do
        get 'search', on: :collection
      end

      resources :categories do
        get "landCats", on: :collection
      end
      
      resources :users, only: [:show] do
        post :favorite, on: :collection
        get :favorites, on: :collection
        post :unfavorite, on: :collection
      end

      resources :pharmacies do
        get 'pharmacy_drugs', on: :collection
        post "add"
        delete "remove"
      end
    end
  end


end
