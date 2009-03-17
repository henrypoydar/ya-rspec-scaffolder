require File.dirname(__FILE__) + '/../../spec_helper'

describe '<%= plural_name %>/show' do

  before :each do
    assigns[:<%= singular_name %>] = mock_model(<%= class_name %>)
    render '<%= plural_name %>/show'
  end

  it 'should render successfully' do
    response.should be_success
  end
  
end