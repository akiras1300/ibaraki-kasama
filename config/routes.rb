Rails.application.routes.draw do
  root 'pages#index'

  get 'pages/show'
  resources :feeds do
    member do
     resources :entries, only: [:index, :show]
    end
  end
  get 'feeds/show/:id/:page' => 'feeds#show'
  get 'entries/index' => 'entries#index'
  get 'entries/show/:id' => 'entries#show'
  get 'inquiry' => 'inquiry#index'              # 入力画面
   post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
   post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
