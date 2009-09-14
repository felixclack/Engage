Factory.define :note do |note|
  note.body 'A note about this person'
  note.association :creator, :factory => :user
  note.association :partner
end
