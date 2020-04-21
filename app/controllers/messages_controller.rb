class MessagesController < ApplicationController
  before_action :message_params, only: %i[create]
  
  def create
    @message = Message.new(message_params)
    if @message.save!
      redirect_to root_path
    else
      flash[danger]="Failed To Send Message"
      redirect_to root_path
    end
  end

  private

  def message_params
    params.permit(:user_id, :conversation_id, :body)
  end
end
