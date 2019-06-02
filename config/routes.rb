Rails.application.routes.draw do
  devise_for :users

  root to: 'pastes#index'

  get 'healths/check', to: 'healths#check'

  resource :pastes, only: %i[create]
  get 'pastes/:shortlink', to: 'pastes#show'

  mount Sidekiq::Monitor::Engine => '/sidekiq'
end
