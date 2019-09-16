Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/event_participation', to: 'event_participation#index'
      get '/events', to: 'events#index'
      get '/medal_count', to: 'medal_count#index'
      get '/medalists', to: 'medalists#index'
      get '/olympians', to: 'olympians#index'
      get '/olympian_stats', to: 'olympian_stats#index'
    end
  end
end
