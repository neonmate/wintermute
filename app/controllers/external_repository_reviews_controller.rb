class ExternalRepositoryReviewsController < ApplicationController

  power crud: :external_repository_reviews, as: :external_repository_review_scope

  def index
    load_external_repository_reviews
  end

  def update
    load_external_repository_review
    build_external_repository_review
    save_external_repository_review
  end

  private

  def load_external_repository_reviews
    @external_repository_reviews = external_repository_review_scope
      .pending
      .default_order
      .paginate(page: params[:page])
      .to_a
  end

  def load_external_repository_review
    @external_repository_review ||= external_repository_review_scope.find(params[:id])
  end

  def build_external_repository_review
    @external_repository_review ||= external_repository_review_scope.new
    @external_repository_review.attributes = external_repository_review_params
  end

  def save_external_repository_review
    if @external_repository_review.save
      success_flash(@external_repository_review)
    else
      flash[:error] = 'Repository already exists'
    end

    redirect_to external_repository_reviews_path
  end

  def external_repository_review_params
    external_repository_review_params = params[:external_repository_review]
    return {} if external_repository_review_params.blank?

    external_repository_review_params.permit(:state_event)
  end

end
