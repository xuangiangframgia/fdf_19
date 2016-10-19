Rails.application.routes.draw do
  devise_for :users
  root "staticpages#index"
  namespace :admin do
    root "admin#index"
  end
end
