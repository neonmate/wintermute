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

    def permitted_repository_attributes
      permitted_params = [
        :repository_url,
      ]

      if updatable_repositories?
        permitted_params += [
          :preview_image,
          :preview_image_cache,
          :state_event,
          :delivery_model,
        ]
      end

      permitted_params
    end

  end
end
