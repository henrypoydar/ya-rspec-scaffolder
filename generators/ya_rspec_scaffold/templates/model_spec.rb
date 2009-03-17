require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe <%= class_name %> do
  
  before :each do
    @valid_attributes = {}
  end
  
  describe 'associations' do
    
  end
  
  describe 'validations' do
    
    it 'should create a new instance given valid attributes' do
      <%= class_name %>.create!(@valid_attributes).should be_true
    end
    
  end
  
  describe 'callbacks' do
  
  end
  
  describe 'named scopes' do
    
  end
  
  describe 'behaviors' do
    
  end
  
end