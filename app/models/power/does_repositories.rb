module Power::DoesRepositories
  as_trait do

    power :repositories do
      Repository.all
    end

    power :updatable_repositories do
      if admin?
        Repository.all
      end
    end

    power :creatable_repositories do
      if user.present?
        Repository.where(user: user)
      end
    end

    power :destroyable_repositories do
      if admin?
        Repository.all
      end
    end

  end
end
