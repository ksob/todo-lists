class MessagesController < ApplicationController
  load_and_authorize_resource

  def create
    @message = Message.create!(params[:message].merge(:todo_list_id => params[:todo_list_id]))
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def toggle_status
    @todo_list = TodoList.find(params[:todo_list_id])
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes({:status => !@message.status})
        format.js
      end
    end
  end

  def destroy
    @todo_list = TodoList.find(params[:todo_list_id])
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to todo_lists_url }
      format.js
      format.json { head :ok }
    end
  end

end
