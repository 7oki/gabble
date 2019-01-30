class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :index, :show]
  
  def index
    @rooms = MessageRoom.where(user1_id: current_user.id)
  end
  
  def show
    @rooms = MessageRoom.where(user1_id: current_user.id)
    @user = User.find_by(id: params[:user_id])
    @room_id = message_room_id(current_user, @user)
    @messages = Message.where(room_id: @room_id)
    Notification.create(user_id: params[:user_id], from_id: current_user.id, type: 2)
  end
  
  def create
    @message = Message.new(messages_params)
    if @message.save
      flash[:success] = "メッセージ送信に成功しました"
      #room作成
      user1_id = @message.from_id
      user2_id = @message.to_id
      MessageRoom.create(user1_id: user1_id, user2_id: user2_id)
      MessageRoom.create(user1_id: user2_id, user2_id: user1_id)
    else
      flash[:danger] = "メッセージ送信に失敗しました"
    end
    redirect_to "/messages/#{@message.to_id}"
  end
  
  private
    def messages_params
      params.permit(:from_id,:to_id,:room_id,:content)
    end
    
    def create_room
    end
  
end
 