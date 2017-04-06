Rails.application.routes.draw do
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/welcome"=>"welcome#say"
  get "/welcome/say_hello"=>"welcome#index"
  root "welcome#index"
  match ':controller(/:action(/:id(.:format)))',:via=>:all
end
