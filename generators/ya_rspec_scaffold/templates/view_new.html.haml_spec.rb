require File.dirname(__FILE__) + '/../../spec_helper'

describe '<%= plural_name %>/new' do

  before :each do
    assigns[:<%= singular_name %>] = <%= class_name %>.new
    render '<%= plural_name %>/new'
  end

  it 'should render a new form' do
    response.should have_tag("form[action=?][method=post]", <%= plural_name %>_path) do; end
  end

  it 'should render successfully' do
    response.should be_success
  end
  
end