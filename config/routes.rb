Rails.application.routes.draw do


  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do

      resource :session, only: %i(show create destroy)
      resources :users  do
        collection do
          put :forgot_password
          put :reset_password
          get :verify_reset_token
          put :activate_user
          put :activation_password
        end
        member do
          put :update_password
          put :update_avatar
        end
      end
    end
  end

  get "*path" => "application#index"
  root to: "application#index"
end
