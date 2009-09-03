require File.dirname(__FILE__) + '/../test_helper'

class TitleTest < ActiveSupport::TestCase
  should_have_db_column :name
  
  subject { Factory(:title) }
  
  should_validate_presence_of :name
end
