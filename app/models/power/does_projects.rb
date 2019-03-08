module Power::DoesProjects
  as_trait do

    power :projects do
      Project.all
    end

    power :updatable_projects do
      Project.where(user: user)
    end

    power :creatable_projects do
      Project.where(user: user)
    end

    power :destroyable_projects do
      Project.where(user: user)
    end

  end
end