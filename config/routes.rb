Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :pastes, only: %i[create]
  get 'pastes/:shortlink', to: 'pastes#show'

  mount Sidekiq::Monitor::Engine => '/sidekiq'
end
