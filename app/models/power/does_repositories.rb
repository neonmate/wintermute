module Power::DoesRepositories
  as_trait do

    power :repositories do
      Repository.all
    end

    power :updatable_repositories do
      Repository.where(user: user) if user
    end

    power :creatable_repositories do
      Repository.where(user: user) if user
    end

    power :destroyable_repositories do
      Repository.where(user: user) if user
    end

  end
end
