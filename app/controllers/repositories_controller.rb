class RepositoriesController < ApplicationController

  power crud: :repositories, as: :repository_scope

  def index
    load_repositories
  end

  def show
    load_repository
  end

  def new
    build_repository
  end

  def create
    build_repository
    save_repository
  end

  def edit
    load_repository
    build_repository
  end

  def update
    load_repository
    build_repository
    save_repository
  end

  def destroy
    load_repository
    @repository.destroy!
    destroy_flash(@repository)
    redirect_to repositories_path
  end

  private

  def load_repositories
    @repositories = repository_scope
      .default_order
      .active
      .includes(:user_subscriptions)
      .paginate(page: params[:page])
      .filtered(params[:query])
      .to_a
  end

  def load_repository
    @repository ||= repository_scope.find(params[:id])
  end

  def build_repository
    @repository ||= repository_scope.new
    @repository = ActiveType.cast(@repository, Repository::Form)
    @repository.attributes = repository_params
  end

  def save_repository
    action = @repository.new_record? ? :new : :edit

    if @repository.save
      success_flash(@repository)
      redirect_to(@repository)
    else
      error_flash(@repository)
      render(action, status: :unprocessable_entity)
    end
  end

  def repository_params
    repository_params = params[:repository]
    return {} if repository_params.blank?

    repository_params.permit(:repository_url)
  end

end
