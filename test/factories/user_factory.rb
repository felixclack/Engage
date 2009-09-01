Factory.define :user do |f|
  f.email                   'user@example.com'
  f.password                'secret'
  f.password_confirmation   'secret'
  f.full_name               'User'
  f.association             :account
end

Factory.define :another_user, :parent => :user do |f|
  f.email 'another_user@example.com'
end