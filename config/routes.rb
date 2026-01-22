Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    },
    defaults: { format: :json }

  namespace :api do
    namespace :admin do
      resources :sub_admins, only: [:create]
    end

    resources :products
    resources :cart_items, only: [:create]
  end
end
