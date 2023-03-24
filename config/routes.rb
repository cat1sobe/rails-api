Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  

  namespace :api do
    namespace :v1 do
      #/api/v1/auth に認証用のエンドポイントを設定する
      mount_devise_token_auth_for 'User', at: 'auth'

      get 'users' => 'users#index'
      resources :books
    end
  end
end
