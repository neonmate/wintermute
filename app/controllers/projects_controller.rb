class ProjectsController < ApplicationController

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
    @projects = Project.all.to_a
  end

  def load_project
    @project ||= Project.find(params[:id])
  end

  def build_project
    @project ||= Project.new
    @project.attributes = project_params
  end

  def save_project
    action = @project.new_record? ? :new : :edit

    if @project.save
      success_flash(@project)
      redirect_to(@project)
    else
      error_flash(@project)
      render(action)
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
