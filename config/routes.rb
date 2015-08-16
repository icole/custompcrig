Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :parts, only: [:index,:update], defaults: {format: :json}
    end
  end

  root to: 'application#index'
  get '*path' => 'application#index'
end
