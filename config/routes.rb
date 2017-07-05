Rails.application.routes.draw do
  get 'tags/index'

  get 'tags/show/:id' => 'tags#show'

  get 'urls/index'

  get 'urls/show'

  root 'entries#index'

  get 'pages/show'
  resources :feeds do
    member do
     resources :entries, only: [:index, :show]
    end
  end
  get 'feeds/show/:id/:page' => 'feeds#show'
  get 'entries' => 'entries#index'
  get 'entries/show/:id' => 'entries#show'
  get 'entries/update' => 'entries#update'
  get 'inquiry' => 'inquiry#index'              # 入力画面
   post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
   post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
