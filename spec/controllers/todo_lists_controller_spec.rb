require 'spec_helper'

describe TodoListsController do
  login_user

  before (:each) do
    @todo_list = create(:todo_list)
  end

  describe "GET index" do
    it "should be successful" do
      get :index
      response.should be_success
    end
    
    it "assigns all todo_lists to @todo_lists" do
      get :index
      assigns(:todo_lists).should eq([@todo_list])
    end
    
    it "should render the right view" do
      get :index
      response.should render_template("index")
    end
  end
  
  describe "GET show" do
    it "should be successful" do
      get :show, :id => @todo_list.id
      response.should be_success
    end

    it "should find the right todo_list" do
      get :show, :id => @todo_list.id
      assigns(:todo_list).should == @todo_list
    end
    
    it "should render the right view" do
      get :show, :id => @todo_list.id
      response.should render_template("show")
    end
  end
  
  describe "GET new" do
    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should create a new todo_list" do
      get :new
      assigns(:todo_list).should be_a_new(TodoList)
    end
    
    it "should render the right view" do
      get :new
      response.should render_template("new")
    end
  end
  
  describe "POST create" do
    it "should be successful" do
      post :create, :todo_list => attributes_for(:todo_list)
      response.should be_redirect
    end

    it "should save the todo_list" do
      post :create, :todo_list => attributes_for(:todo_list)
      assigns(:todo_list).should_not be_a_new(TodoList)
    end
    
    it "should redirect to the new todo_list" do
      post :create, :todo_list => attributes_for(:todo_list)
      response.should redirect_to(todo_list_path(@todo_list.id.succ))
    end
  end
  
  

end