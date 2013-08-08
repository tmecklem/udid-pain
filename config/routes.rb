UdidPain::Application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      get "devices/:udid/status" => "devices#status"
      post "devices/:udid/register" => "devices#register"
    end
  end

  match 'devices/:id/update_for_keep' => 'devices#update_for_keep', :as => :update_for_keep
  match 'devices/:id/keep' => 'devices#keep', :as => :keep_device
  post 'devices/search' => 'devices#perform_search', :as => :perform_search
  get 'devices/add_device', :as => :add_device
  post 'devices/add_device' => 'devices#save_device', :as => :save_device
  get 'devices/export', :as => :export_devices
  match 'devices' => 'devices#index'
  
  root :to => 'devices#index'
end
