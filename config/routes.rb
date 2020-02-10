Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get "/", to: "static#home"
  get "/about", to: "static#about"
  get "/contact", to: "static#contact"
  get "/users", to: "static#users"
  get "/edit", to: "static#edit"
  get "/sign_in", to: "static#sign_in"
  get "/sign_out", to: "static#sign_out"

  resources :professions
end
