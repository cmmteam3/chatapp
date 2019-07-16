Rails.application.routes.draw do
  
  get 'thread_replies/index'
  get 'thread_replies/show'
   devise_for :users
   root 'workspaces#index'
   resources :channels do
   	resources :channels_user
   end
  # get 'search/search'
  # get 'workspaces/index'
  # get 'workspaces/show'
  # get 'workspaces/new'

  # get 'workspaces/edit'









# root 'workspaces#index'

resources :thread_replies
resources :messages
resources :workspaces




 



  


 # get '/singup', to:'signup#new'
 # post '/signup', to:'signup#create'


 # get '/workspace/new', to:'workspace#new'
 # post '/workspace', to:'workspace#create'
#get  'workspace/show', to: 'workspace#show'
# get '/destroy/:id', to: 'workspace#delete'
# get '/edit/:id', to: 'workspace#edit'
# post '/workspace', to:'workspace#update'

# get '/dashboard', to:'dashboard#index'

# get '/edit', to:'dashboard#edit'

end
