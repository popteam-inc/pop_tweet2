Rails.application.routes.draw do
  namespace 'api' do
    resources :autopost
    resources :autolike
    resources :autofollow
    resources :autounfollow
  end
  get '/auth/:provider/callback', to: 'sessions#callback'
end
