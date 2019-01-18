Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :v1 do
    # Inside this will be the endpoints
    resources :provinces, only: [:index, :show, :update, :create, :destroy]
  end
end
