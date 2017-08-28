Rails.application.routes.draw do
  #setting todos and nesting items RESTful routes
  resources :todos do
    resources :items
  end
end
