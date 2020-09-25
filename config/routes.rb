Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'site_map', to: 'site_map#index'
    end
  end
end
