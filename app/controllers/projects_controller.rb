class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_location
  before_action :find_unit
  before_action :find_project, only: [:show, :edit, :update, :destroy, :create_comment, :delete_comment]
  before_action :find_comment, only: [:delete_comment] 
  def index
    @projects = Project.all
  end

  def show
    @comment = @project.comments.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = @unit.projects.create project_params
    if @project.save == true 
    redirect_to location_unit_path(@location, @unit)
    else 
    render :new
    end
  end

  def edit
  end

  def update
    @project.update_attributes project_params
    redirect_to location_unit_path(@location, @unit)
  end

  def destroy
    @project.delete
    redirect_to location_unit_path(@location, @unit)
  end

  def create_comment
    @comment = @project.comments.create comment_params.merge(user_id: current_user.id, first_name: current_user.first_name, last_name: current_user.last_name)
    redirect_to location_unit_project_path(@location, @unit, @project)
  end

  def delete_comment
    @comment.delete
    redirect_to location_unit_project_path(@location, @unit, @project)
  end

  private
  def project_params
  params.require(:project).permit(:name, :date, :description, :requirements, :workflow_state)
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id, :first_name, :last_name)
  end

  def find_location
  @location = Location.find params[:location_id]
  end

  def find_unit
  @unit = Unit.find params[:unit_id]
  end

  def find_project
  @project = Project.find params[:id]
  end

  def find_comment
    @comment = @project.comments.find params[:comment_id]
  end

end
