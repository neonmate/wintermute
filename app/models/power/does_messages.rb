module Power::DoesMessages
  as_trait do

    power :updatable_messages do
      Message.where(user: user) if user
    end

    power :creatable_messages do
      Message.where(user: user) if user
    end

    power :destroyable_messages do
      Message.where(user: user) if user
    end

  end
end
