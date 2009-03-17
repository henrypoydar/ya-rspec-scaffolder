require File.dirname(__FILE__) + '/../../spec_helper'

describe '<%= plural_name %>/index' do

  before :each do
    <%= singular_name %> = mock_model(<%= class_name %>)
    assigns[:<%= plural_name %>] = [<%= singular_name %>]
    render '<%= plural_name %>/index'
  end

  it 'should render successfully' do
    response.should be_success
  end
  
end