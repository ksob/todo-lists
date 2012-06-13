require 'spec_helper'

describe MessagesController do
  login_user

  before (:each) do
    @message = create(:message)
  end
  
  describe "POST create" do
    it "should return javascript" do
      xhr :get, :create, :todo_list_id => "1", :message => attributes_for(:message)
      response.header['Content-Type'].should include 'text/javascript'
    end

    it "should save the message" do
      xhr :get, :create, :todo_list_id => "1", :message => attributes_for(:message)
      assigns(:message).should_not be_a_new(Message)
    end
    
    it "should pass todo_list of the message to the view" do
      xhr :get, :create, :todo_list_id => "1", :message => attributes_for(:message)
      assigns(:todo_list).should_not be_a_new(TodoList)
    end
  end
  
  describe "POST toggle_status" do
    it "should return javascript" do
      xhr :get, :toggle_status, :todo_list_id => "1", :id => @message.id
      response.header['Content-Type'].should include 'text/javascript'
    end

    it "should change status of the message" do
      xhr :get, :toggle_status, :todo_list_id => "1", :id => @message.id
      assigns(:message).should_not be(@message)
    end
    
    it "should pass todo_list of the message to the view" do
      xhr :get, :toggle_status, :todo_list_id => "1", :id => @message.id
      assigns(:todo_list).should_not be_a_new(TodoList)
    end
  end

end