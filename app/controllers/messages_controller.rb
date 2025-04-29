class MessagesController < ApplicationController
    before_action :require_login
  
    def new
      @message = Message.new
      @recipient = User.find(params[:recipient_id])
      @listing = Listing.find(params[:listing_id])
    end
  
    def create
      @message = current_user.sent_messages.build(message_params)
      if @message.save
        redirect_to unified_messages_path, notice: "Message sent!"
      else
        render :new
      end
    end
  
    def unified
      @received_messages = current_user.received_messages.order(created_at: :desc)
      @sent_messages = current_user.sent_messages.order(created_at: :desc)
    end
    


  
    private
  
    def message_params
      params.require(:message).permit(:recipient_id, :listing_id, :body)
    end
  end
  