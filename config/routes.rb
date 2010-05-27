ActionController::Routing::Routes.draw do |map|
  map.connect '/', :controller => :users, :action => :new
  map.reset "reset", :controller => :users, :action => :detonate
  map.logout 'logout', :controller => :user_sessions, :action => :destroy
  map.login 'login', :controller => :user_sessions, :action => :new
  map.authenticate 'authenticate', :controller => :user_sessions, :action => :create, :conditions => {:method => :post}
  map.signup 'signup', :controller => :users, :action => :new, :as => :signup
  map.register 'register', :controller => :users, :action => :create, :conditions => {:method => :post}
  map.connected 'connected', :controller => :users, :action => :update, :conditions => {:method => :put}
  map.resources :users
  map.resource :user_session
  
  map.profile ':id', :controller => :users, :action => :show
  map.root :controller => 'users'
end
