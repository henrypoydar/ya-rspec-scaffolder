require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe <%= controller_class_name %>Controller do
  
  before :each do
    @<%= singular_name %> = mock_model(<%= class_name %>, :id => 36)
    @<%= plural_name %> = [@<%= singular_name %>]
    <%= class_name %>.stub!(:find).and_return(@<%= singular_name %>)
    <%= class_name %>.stub!(:all).and_return(@<%= plural_name %>)
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
      route_for(action).should == {:path => <%= plural_name %>_path, :method => :post}
      params_from(:post, <%= plural_name %>_path).should == action
    end

    it 'should route to edit' do
      action = {:controller => '<%= plural_name %>', :action => 'edit', :id => '1'}
      route_for(action).should == edit_<%= singular_name %>_path(1)
      params_from(:get, edit_<%= singular_name %>_path(1)).should == action
    end
    
    it 'should route to update' do
      action = {:controller => '<%= plural_name %>', :action => 'update', :id => '1'}
      route_for(action).should == {:path => <%= singular_name %>_path(1), :method => :put}
      params_from(:put, <%= singular_name %>_path(1)).should == action
    end

    it 'should route to destroy' do
      action = {:controller => '<%= plural_name %>', :action => 'destroy', :id => '1'}
      route_for(action).should == {:path => <%= singular_name %>_path(1), :method => :delete}
      params_from(:delete, <%= singular_name %>_path(1)).should == action
    end
    
  end
  
  describe '#index' do
    
    before :each do
      get(:index)
    end
    
    it "should find all of the <%= plural_name %> and assign it to an instance variable" do
      assigns[:<%= plural_name %>].should == [@<%= singular_name %>]
    end
    
    it 'should render the index template' do
      response.should render_template('index')
    end
    
    it 'should return xml if requested' do
      @<%= plural_name %>.should_receive(:to_xml).and_return('<xml></xml>')
      get :index, :format => 'xml'
      response.body.should == '<xml></xml>'
    end
    
  end
  
  
  describe '#show' do
    
    before :each do
      get(:show, :id => @<%= singular_name %>)
    end
  
    it 'should find a <%= singular_name %> from the id' do
      assigns[:<%= singular_name %>].should == @<%= singular_name %>
    end
    
    it 'should render the show template' do
      response.should render_template('show')
    end
    
    it 'should return xml if requested' do
      @<%= singular_name %>.should_receive(:to_xml).and_return('<xml></xml>')
      get :show, :id => @<%= singular_name %>, :format => 'xml'
      response.body.should == '<xml></xml>'
    end
 
  end
 
  describe '#new' do
    
    before :each do
      get(:new)
    end
    
    it 'should assign a new <%= singular_name %> instance variable' do
      assigns[:<%= singular_name %>].class.should == <%= class_name %>
      assigns[:<%= singular_name %>].should be_new_record
    end
     
    it 'should render the new template' do
      response.should render_template('new')
    end
    
  end
 
  describe '#create' do
    
    def do_create
      post(:create, {})
    end
    
    describe 'on success' do
      
      before :each do
        <%= class_name %>.stub!(:new).and_return(@<%= singular_name %> = mock_model(<%= class_name %>, :save => true))
      end
      
      it 'should display a flash notice' do
        do_create
        flash[:success].should_not be_nil
      end
      
      it 'should redirect to the show action for the newly created object' do
        do_create
        assigns[:<%= singular_name %>].should == @<%= singular_name %>
        response.should redirect_to(:action => 'show', :id => @<%= singular_name %>)
      end
      
    end
    
    describe 'on failure' do
      
      before :each do
        <%= class_name %>.stub!(:new).and_return(@<%= singular_name %> = mock_model(<%= class_name %>, :save => false))
      end

      it 'should not display a flash success notice' do
        do_create
        flash[:success].should be_nil
      end

      it 'should assign @<%= singular_name %> and render the new action' do
        do_create
        assigns[:<%= singular_name %>].should == @<%= singular_name %>
        response.should render_template('new')
      end
      
    end
    
  end
  
  describe "#edit" do
    
    before :each do
      get(:edit, :id => 36)
    end

    it "should render the edit template" do
      response.should render_template('edit')
    end

    it "should assign a new @<%= singular_name %> instance variable" do
      assigns[:<%= singular_name %>].class.should == <%= class_name %>
      assigns[:<%= singular_name %>].should == @<%= singular_name %>
    end
    
  end
 
  describe "#update" do
    
    def do_update
      post(:update, :id => @<%= singular_name %>)
    end

    describe 'on success' do
    
      before :each do
        @<%= singular_name %>.stub!(:update_attributes).and_return(true)
      end
      
      it 'should display a flash notice' do
        do_update
        flash[:success].should_not be_nil
      end

      it 'should redirect to the show action for the udpated object' do
        do_update
        assigns[:<%= singular_name %>].should == @<%= singular_name %>
        response.should redirect_to(:action => 'show', :id => @<%= singular_name %>)
      end
    
    end
    
    describe 'on failure' do
      
      before :each do
        @<%= singular_name %>.stub!(:update_attributes).and_return(false)
      end
      
      it 'should not display a flash success notice' do
        do_update
        flash[:success].should be_nil
      end

      it 'should assign @<%= singular_name %> and render the edit action' do
        do_update
        assigns[:<%= singular_name %>].should == @<%= singular_name %>
        response.should render_template('edit')
      end
      
    end
    
  end
 
  describe "#destroy" do
    
    before :each do
      @<%= singular_name %>.stub!(:destroy).and_return(true)
    end
    
    def do_delete
      delete :destroy, :id => @<%= singular_name %>
    end
    
    it "should flash a success message" do
      do_delete
      flash[:success].should_not be_nil
    end
    
    it "should redirect to the index" do
      do_delete
      response.should redirect_to(:action => 'index')
    end
    
  end
 
end