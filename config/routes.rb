Rails.application.routes.draw do
  
 scope "(:locale)", locale: /en|ja/ do
  get 'my_aj/new'
  get 'users_workspace/index'
  get 'users_workspace/update'
  root 'signup#index'
  get    '/signup',   to: 'signup#index'
  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  get 'logout', to: 'session#destroy'
  resources :signup
  get 'thread_replies/new'
  get 'thread_replies/show'
  get '/star', to:'messages#StarShow'
  get "/star",to:"messages#ssss"
  post "/star",to:"messages#star"


   resources :channels do
   	resources :channels_user
   end
resources :generals
resources :thread_replies
resources :messages

resources :workspaces do 
  resources :users_workspace

end

end


end



 



  


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


