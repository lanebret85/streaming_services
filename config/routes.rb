Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/streaming_services", to: "streaming_services#index"
  get "/streaming_services/new", to: "streaming_services#new"
  get "/streaming_services/:id", to: "streaming_services#show"
  get "/shows", to: "shows#index"
  get "/shows/:id", to: "shows#show"
  get "/streaming_services/:id/shows", to: "streaming_service_shows#index"
  post "/streaming_services", to: "streaming_services#create"
  get "/streaming_services/:id/edit", to: "streaming_services#edit"
  patch "/streaming_services/:id", to: "streaming_services#update"
  get "/streaming_services/:id/shows/new", to: "streaming_service_shows#new"
  post "/streaming_services/:id/shows", to: "streaming_service_shows#create"
  get "/shows/:id/edit", to: "shows#edit"
  patch "/shows/:id", to: "shows#update"
end
