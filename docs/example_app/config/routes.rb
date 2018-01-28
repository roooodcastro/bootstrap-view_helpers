Rails.application.routes.draw do
  root to: 'home#index'

  resource :alert, only: :show
end
