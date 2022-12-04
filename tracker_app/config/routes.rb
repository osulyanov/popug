Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks do
    get :my, on: :collection
    put :complete, on: :member
  end
end
