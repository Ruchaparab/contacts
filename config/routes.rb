Rails.application.routes.draw do
  root to: 'contacts#new'
  resources :contacts, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match "*path", to: "contacts#new", via: :all
end
