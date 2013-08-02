UdidPain::Application.routes.draw do
  
  match 'devices/:id/update_for_keep' => 'devices#update_for_keep', :as => :update_for_keep
  match 'devices/:id/keep' => 'devices#keep', :as => :keep_device
  post 'devices/search' => 'devices#perform_search', :as => :perform_search
  match 'devices' => 'devices#index'
  
  root :to => 'devices#index'
end
