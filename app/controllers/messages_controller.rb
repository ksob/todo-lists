class MessagesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(params[:message].merge(:todo_list_id => params[:todo_list_id]))
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def toggle_status
    @todo_list = TodoList.find(params[:todo_list_id])
    @message = Message.find(params[:id])
    #@message.destroy
        #@message = Message.find(params[:todo_list_id])
   # @message = Message.find(params[:content])
    #@message.destroy_tasks
    #@message.status = !@message.status
    #@message.save
    respond_to do |format|
      if @message.update_attributes({:status => !@message.status})
        format.html { redirect_to @message, notice: 'Todo list was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
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
