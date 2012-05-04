class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(params[:message].merge(:todo_list_id => params[:todo_list_id]))
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def destroy
    @todo_list = TodoList.find(params[:todo_list_id])
    @message = Message.find(params[:id])
    @message.destroy
        #@message = Message.find(params[:todo_list_id])
   # @message = Message.find(params[:content])
    #@message.destroy_tasks

    respond_to do |format|
      format.html { redirect_to todo_lists_url }
      format.js
      format.json { head :ok }
    end
  end

end
