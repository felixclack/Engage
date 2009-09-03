namespace :populate do
  
  task :reset => :environment do
    Rake::Task["populate:setup"].invoke
    Rake::Task["populate:lookups"].invoke
  end
  
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
    
    partner = @account.partners.build(
      :full_name => "Leanne Clack",
      :email => "leanneclack@gmail.com"
    )
    partner.creator = user
    partner.save!
    
    partner = @account.partners.build(
      :full_name => "Ruby Clack",
      :email => "rubyclack@gmail.com"
    )
    partner.creator = user
    partner.save!
  end
  
  desc "Setup default titles"
  task :lookups => :environment do
    %w(Mr Mrs Ms Miss Dr Rev Other).each do |t|
      Title.create!(:name => t)
    end
    
    %w(Male Female).each do |gender|
      Gender.create!(:name => gender)
    end
  end
  
end