require File.dirname(__FILE__) + '/../../spec_helper'

describe '<%= plural_name %>/edit' do

  before :each do
    @<%= singular_name %> = mock_model(<%= class_name %>)
    assigns[:<%= singular_name %>] = @<%= singular_name %>
    render '<%= plural_name %>/edit'
  end

  it 'should render successfully' do
    response.should be_success
  end
  
  it 'should render an edit form' do
    response.should have_tag("form[action=#{<%= singular_name %>_path(@<%= singular_name %>)}][method=post]") do; end
  end
  
end