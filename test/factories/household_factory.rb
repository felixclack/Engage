Factory.define :household do |household|
  household.street '1 Street'
  household.town 'Aycliffe'
  household.county 'Co. Durham'
  household.postcode 'DL5 4ZE'
  household.country 'UK'
  household.associations :account
end
