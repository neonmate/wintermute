module Power::DoesIdeas
  as_trait do

    power :ideas do
      Idea.all
    end

    power :updatable_ideas do
      Idea.where(user: user) if user
    end

    power :creatable_ideas do
      Idea.where(user: user) if user
    end

    power :destroyable_ideas do
      Idea.where(user: user) if user
    end

  end
end
