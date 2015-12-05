Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :templates do
      # get 'templates'
    end
  end
end
