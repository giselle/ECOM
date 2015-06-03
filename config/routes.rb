Rails.application.routes.draw do

  get "/products" => 'products#index'

  get "/products/new" => 'products#new'

  get "/products/:id" => 'products#show'

   post "/products" => 'products#create'

  get "/products/:id/edit" => 'products#edit'

  patch "/prodcuts/:id" => 'products#update'

  delete "/products/:id" => 'products#destroy'
end
