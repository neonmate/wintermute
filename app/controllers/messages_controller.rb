class MessagesController < ApplicationController

  power crud: :messages, as: :message_scope

  def new
    build_message
  end

  def create
    build_message
    save_message
  end

  def edit
    load_message
    build_message
  end

  def update
    load_message
    build_message
    save_message
  end

  def destroy
    load_message
    @message.destroy!
    destroy_flash(@message)
    redirect_to @message.parent
  end

  private

  def load_message
    @message ||= message_scope.find(params[:id])
  end

  def build_message
    @message ||= message_scope.new
    @message.attributes = message_params
  end

  def save_message
    action = @message.new_record? ? :new : :edit

    if @message.save
      success_flash(@message)
      redirect_to(@message.parent)
    else
      error_flash(@message)
      render(action, status: :unprocessable_entity)
    end
  end

  def message_params
    message_params = params[:message]
    return {} if message_params.blank?

    message_params.permit(:body, :parent_id, :parent_type)
  end

end
