Rails.application.routes.draw do
  root 'entries#index'
  resources 'events'
  resources 'imgs'
  resources 'places'
  resources 'tags'
  get 'tags/:id/img'=> 'tags#img'
  patch "/tags/:id/imgset"=> 'tags#imgset'
  get 'tags/:id/url'=> 'tags#url'
  post "/tags/:id/urlset"=> 'tags#urlset'
  resources 'entries'
  get 'urls'=> 'urls#index'
  get 'urls/facebook'
  get 'urls/twitter'
  get 'urls/instagram'
  get 'pages/show'
  resources :feeds do
    member do
     resources :entries, only: [:index, :show]
    end
  end
  get 'feeds/show/:id/:page' => 'feeds#show'
  get 'inquiry' => 'inquiry#index'              # 入力画面
   post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
   post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
