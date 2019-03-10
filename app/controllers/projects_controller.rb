class ProjectsController < ApplicationController

  power crud: :projects, as: :project_scope

  def index
    load_projects
  end

  def show
    load_project
  end

  def new
    build_project
  end

  def create
    build_project
    save_project
  end

  def edit
    load_project
  end

  def update
    load_project
    build_project
    save_project
  end

  def destroy
    load_project
    @project.destroy!
    destroy_flash(@project)
    redirect_to projects_path
  end

  private

  def load_projects
    @projects = project_scope
      .filtered(params[:query])
      .to_a
  end

  def load_project
    @project ||= project_scope.find(params[:id])
  end

  def build_project
    @project ||= project_scope.new
    @project = ActiveType.cast(@project, Project::Form)
    @project.attributes = project_params
  end

  def save_project
    action = @project.new_record? ? :new : :edit

    if @project.save
      success_flash(@project)
      redirect_to(@project)
    else
      error_flash(@project)
      render(action, status: :unprocessable_entity)
    end
  end

  def project_params
    project_params = params[:project]
    return {} if project_params.blank?

    project_params.permit(
      :title,
      :subtitle,
      :description,
      :repository_url,
      :application_url
    )
  end

end
