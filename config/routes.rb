Rails.application.routes.draw do
  devise_for :users
root "authors#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :authors
  # here we create the 7 restful routes for authors
  # resources :authors do
  #   # we then create nested routes for the books within the authors
  #   resources :books
  # end

end
