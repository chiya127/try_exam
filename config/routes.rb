Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#top'

  resources :genres, only: [:index], constraints: { id: /\d+/ } do
    resources :questions, only: [], constraints: { id: /\d+/ } do
      get :solution
      post :result
    end
  end

end
