require File.dirname(__FILE__) + '/../test_helper'

class GenderTest < ActiveSupport::TestCase
  should_have_db_column :name
  
  should_validate_presence_of :name
end
