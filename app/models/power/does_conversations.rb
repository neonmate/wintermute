module Power::DoesConversations
  as_trait do

    power :conversations do
      Conversation.all
    end

    power :updatable_conversations do
      Conversation.where(user: user) if user
    end

    power :creatable_conversations do
      Conversation.where(user: user) if user
    end

    power :destroyable_conversations do
      Conversation.where(user: user) if user
    end

  end
end
