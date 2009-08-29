ActionController::Routing::Routes.draw do |map|

  map.with_options :controller => 'pages' do |page|
    page.home '/', :action => "show", :id => 'home'
  end
  
  map.root :controller => 'pages', :action => 'show', :id => 'home'

  # See how all your routes lay out with "rake routes"

  # map.with_options :controller => 'sessions'  do |m|
  #   m.login  '/login',  :action => 'new'
  #   m.logout '/logout', :action => 'destroy'
  # end

end
