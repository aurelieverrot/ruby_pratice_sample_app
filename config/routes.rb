Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/about'
  # get 'static_pages/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # You can have the root of your site routed with "root"
  



end
