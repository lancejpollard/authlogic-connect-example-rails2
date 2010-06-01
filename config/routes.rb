ActionController::Routing::Routes.draw do |map|
  map.connect '/', :controller => :users, :action => :new
  
  map.login 'login', :controller => :user_sessions, :action => :new
  map.logout 'logout', :controller => :user_sessions, :action => :destroy, :conditions => {:method => :get}
  map.authenticate 'authenticate', :controller => :user_sessions, :action => :create, :conditions => {:method => :post}
  
  map.register 'register', :controller => :users, :action => :new
  map.signup 'signup', :controller => :users, :action => :create, :conditions => {:method => :post}
  map.connected 'connect', :controller => :users, :action => :update, :conditions => {:method => :put}
  
  map.resources :users
  map.resource :user_session
  
  map.reset "reset", :controller => :users, :action => :detonate

  map.profile ':id', :controller => :users, :action => :show

  map.root :controller => 'users'
end
