Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/streaming_services", to: "streaming_services#index"
  get "/streaming_services/:id", to: "streaming_services#show"
  get "/shows", to: "shows#index"
  get "/shows/:id", to: "shows#show"
end
