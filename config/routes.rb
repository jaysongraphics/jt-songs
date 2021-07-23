Rails.application.routes.draw do
  resources :reviews, only: [:create]
  resources :super_fans, only: [:index, :destroy]
  resources :songs, only: [:index, :show]
  get '/song/top_charts', to: 'song#top_charts'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
