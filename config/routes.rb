Rails.application.routes.draw do
  devise_for :users
  get 'main' => 'pages#main'
  get 'about' => 'pages#about'
  get '/' => 'pages#main'
  post '/' => 'contacts#create'

  resources :contacts do
	   resources :comments
  end
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
