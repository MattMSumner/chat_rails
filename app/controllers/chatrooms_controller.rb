class ChatroomsController < ApplicationController
  def index
    @current_user = current_user
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.create(chatroom_params)
    redirect_to chatroom_path(@chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
