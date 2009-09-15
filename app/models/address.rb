class Address
  attr_reader :street, :town, :county, :postcode, :country
  def initialize(street, town, county, postcode, country="UK")
   @street, @town, @county, @postcode, @country = street, town, county, postcode, country
  end

  def close_to?(other_address)
   town == other_address.town
  end

  def ==(other_address)
   town == other_address.town && street == other_address.street
  end
end