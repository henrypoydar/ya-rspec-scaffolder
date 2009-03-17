require File.dirname(__FILE__) + '/../../spec_helper'

describe '<%= plural_name %>/new' do

  before :each do
    assigns[:<%= singular_name %>] = <%= class_name %>.new
    render '<%= plural_name %>/new'
  end

  it 'should have a submit tag' do
    response.should have_tag('input[type=submit]')
  end

  it 'should render successfully' do
    response.should be_success
  end
  
end