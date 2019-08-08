class ConversationsController < ApplicationController

  power crud: :conversations, as: :conversation_scope

  def index
    load_conversations
  end

  def show
    load_conversation
  end

  def new
    build_conversation
  end

  def create
    build_conversation
    save_conversation
  end

  def edit
    load_conversation
    build_conversation
  end

  def update
    load_conversation
    build_conversation
    save_conversation
  end

  def destroy
    load_conversation
    @conversation.destroy!
    destroy_flash(@conversation)
    redirect_to conversations_path
  end

  private

  def load_conversations
    @conversations = conversation_scope
      .default_order
      .paginate(page: params[:page])
      .filtered(params[:query])
      .to_a
  end

  def load_conversation
    @conversation ||= conversation_scope
      .includes(:messages)
      .find(params[:id])
  end

  def build_conversation
    @conversation ||= conversation_scope.new
    @conversation.attributes = conversation_params
  end

  def save_conversation
    action = @conversation.new_record? ? :new : :edit

    if @conversation.save
      success_flash(@conversation)
      redirect_to(@conversation)
    else
      error_flash(@conversation)
      render(action, status: :unprocessable_entity)
    end
  end

  def conversation_params
    conversation_params = params[:conversation]
    return {} if conversation_params.blank?

    conversation_params.permit(:title, :body)
  end

end
