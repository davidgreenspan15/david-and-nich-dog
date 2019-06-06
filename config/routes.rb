Rails.application.routes.draw do
  resources :owners
  resources :pets
  # delete '/owners/:id', to: "owners#delete"
end
