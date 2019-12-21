class IdeasController < ApplicationController

  power crud: :ideas, as: :idea_scope

  def index
    load_ideas
  end

  def show
    load_idea
  end

  def new
    build_idea
  end

  def create
    build_idea
    save_idea
  end

  def edit
    load_idea
    build_idea
  end

  def update
    load_idea
    build_idea
    save_idea
  end

  def destroy
    load_idea
    @idea.destroy!
    destroy_flash(@idea)
    redirect_to ideas_path
  end

  private

  def load_ideas
    @ideas = idea_scope
      .default_order
      .paginate(page: params[:page])
      .filtered(params[:query])
      .to_a
  end

  def load_idea
    @idea ||= idea_scope
      .includes(:messages)
      .find(params[:id])
  end

  def build_idea
    @idea ||= idea_scope.new
    @idea.attributes = idea_params
  end

  def save_idea
    action = @idea.new_record? ? :new : :edit

    if @idea.save
      success_flash(@idea)
      redirect_to(@idea)
    else
      error_flash(@idea)
      render(action, status: :unprocessable_entity)
    end
  end

  def idea_params
    idea_params = params[:idea]
    return {} if idea_params.blank?

    idea_params.permit(:title, :body)
  end

end
