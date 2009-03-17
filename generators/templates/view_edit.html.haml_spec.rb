require File.dirname(__FILE__) + '/../../spec_helper'

describe '<%= plural_name %>/edit' do

  before :each do
    assigns[:<%= singular_name %>] = mock_model(<%= class_name %>)
    render '<%= plural_name %>/edit'
  end

  it 'should render successfully' do
    response.should be_success
  end
  
  it 'should have a submit tag' do
    response.should have_tag('input[type=submit]')
  end
  
end