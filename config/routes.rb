ActionController::Routing::Routes.draw do |map|
  
  map.resource  :dashboard, :only => :show  
  map.resources :users
  map.resources :partners
  map.resources :accounts,  :has_many => :users

  map.with_options :controller => 'pages' do |page|
    page.home '/home', :action => "show", :id => 'home'
  end
  
  map.root :dashboard

end