require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe <%= controller_class_name %>Controller do
  
  before :each do
    @<%= singular_name %> = <%= class_name %>.create!
    @<%= plural_name %> = [@<%= singular_name %>]
  end
  
  describe "routing" do
    include ActionController::UrlWriter
    
    it 'should route to index' do
      action = {:controller => '<%= plural_name %>', :action => 'index'}
      route_for(action).should == <%= plural_name %>_path
      params_from(:get, <%= plural_name %>_path).should == action
    end
    
    it 'should route to show' do
      action = {:controller => '<%= plural_name %>', :action => 'show', :id => '1'}
      route_for(action).should == <%= singular_name %>_path(1)
      params_from(:get, <%= singular_name %>_path(1)).should == action
    end
    
    it 'should route to new' do
      action = {:controller => '<%= plural_name %>', :action => 'new'}
      route_for(action).should == new_<%= singular_name %>_path
      params_from(:get, new_<%= singular_name %>_path).should == action
    end

    it 'should route to create' do
      action = {:controller => '<%= plural_name %>', :action => 'create'}
      route_for(action).should == <%= plural_name %>_path
      params_from(:post, <%= plural_name %>_path).should == action
    end

    it 'should route to edit' do
      action = {:controller => '<%= plural_name %>', :action => 'edit', :id => '1'}
      route_for(action).should == edit_<%= singular_name %>_path(1)
      params_from(:get, edit_<%= singular_name %>_path(1)).should == action
    end
    
    it 'should route to update' do
      action = {:controller => '<%= plural_name %>', :action => 'update', :id => '1'}
      route_for(action).should == <%= singular_name %>_path(1)
      params_from(:put, <%= singular_name %>_path(1)).should == action
    end

    it 'should route to destroy' do
      action = {:controller => '<%= plural_name %>', :action => 'destroy', :id => '1'}
      route_for(action).should == <%= singular_name %>_path(1)
      params_from(:delete, <%= singular_name %>_path(1)).should == action
    end
    
  end
  
  describe '#index' do
    
    before :each do
      get(:index)
    end
    
    it "should find all of the <%= plural_name %> and assign it to an instance variable" do
      assigns[:<%= plural_name %>].should = [@<%= singular_name %>]
    end
    
    it 'should render the index template' do
      response.should render_template('<%= plural_name %>/index')
    end
    
  end
  
  
  describe '#show' do
    
    before :each do
      get(:show, :id => @<%= singular_name %>.id.to_s)
    end
  
    it 'should find a <%= singular_name %> from the id' do
      assigns[:<%= singular_name %>].should == @<%= singular_name %>
    end
    
    it 'should render the show template' do
      response.should render_template('<%= plural_name %>/show')
    end
 
  end
 
  describe '#new' do
    
    it 'should assign a new <%= singular_name %> instance variable' do
      assigns[:<%= singular_name %>].class.should == <%= class_name %>
      assigns[:<%= singular_name %>].should be_new_record
    end
     
    it 'should render the new template' do
      response.should render_template('<%= plural_name %>/new')
    end
    
  end
 
  describe '#create' do
  end
  
  describe "#edit" do
  end
 
  describe "#update" do
  end
 
  describe "#destroy" do
  end
 
end