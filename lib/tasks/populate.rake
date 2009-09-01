namespace :populate do
  
  desc "Setup dev"
  task :setup => :environment do
    @account = Account.create!(:name => "Xcel")
    
    user = @account.users.build(
      :full_name => "Felix Clack", 
      :password => "secret",
      :password_confirmation => "secret",
      :email => "felixclack@gmail.com"
    )
    
    user.confirm_email!
    user.admin = true
    user.save!
    
    @account.partners.create!(
      :full_name => "Leanne Clack",
      :email => "leanneclack@gmail.com"
    )
    
    @account.partners.create!(
      :full_name => "Ruby Clack",
      :email => "rubyclack@gmail.com"
    )
  end
  
end