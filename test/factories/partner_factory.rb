Factory.define :partner do |f|
  f.full_name     'Partner Name'
  f.email         'partner@example.com'
  f.association   :account
end