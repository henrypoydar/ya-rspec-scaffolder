require File.dirname(__FILE__) + '/../../spec_helper'

describe '<%= plural_name %>/form' do

  before :each do
    render :partial => '<%= plural_name %>/form'
  end

  it 'should render successfully' do
    response.should be_success
  end
  
end