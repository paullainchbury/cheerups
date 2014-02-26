Cheerupapp::Application.routes.draw do
  resources :activities


 devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks'}

 match 'users/:id' => 'users#show', via: :get
 
  resources :cheerups do
    member do
      get :flag
      post :vote
      get :clear_flags
    end
  end

  root :to => "cheerups#index"

  get '/flagged_cheerups', to: 'cheerups#flagged_cheerups', as: 'flagged_cheerups'


end
