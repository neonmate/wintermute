module Power::DoesExternalRepositoryReviews
  as_trait do

    power :external_repository_reviews, :updatable_external_repository_reviews do
      if admin?
        ExternalRepositoryReview.all
      end
    end

  end
end
