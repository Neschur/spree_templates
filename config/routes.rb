Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :templates
  end
end
