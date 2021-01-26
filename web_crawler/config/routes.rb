Rails.application.routes.draw do
  resources :quotes do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    match '/scrape', to: 'quotes#scrape', via: :post, on: :collection
  end

  root to: 'quotes#index'

end
