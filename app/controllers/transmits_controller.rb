class TransmitsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_location
  before_action :find_unit
  before_action :find_project
  before_action :find_transmit, only:[:show, :edit, :update, :destroy, :create_comment, :delete_comment, :reviewed, :completed, :unsatisfactory]
  before_action :find_comment, only:[:delete_comment]
  def index
    @transmits = Transmit.all
  end

  def show
    @comment = @transmit.comments.new
  end

  def new
    @transmit = Transmit.new
  end

  def create
    @transmit = @project.transmits.create transmit_params
    if @transmit.save == true
    redirect_to location_unit_project_transmits_path(@location, @unit, @project, @transmit)
    else
    render :new
    end
  end

  def edit
  end

  def update
    @transmit.update_attributes transmit_params
    redirect_to location_unit_project_transmits_path(@location, @unit, @project, @transmit)
  end

  def destroy
    @transmit.delete
    redirect_to location_unit_path(@location, @unit)
  end

  def create_comment
    @comment = @transmit.comments.create comment_params.merge(user_id: current_user.id, first_name: current_user.first_name, last_name: current_user.last_name)
    redirect_to location_unit_project_transmit_path(@location, @unit, @project, @transmit)
  end

  def delete_comment
    @comment.delete
    redirect_to location_unit_project_transmit_path(@location, @unit, @project, @transmit)
  end

  def reviewed
    authorize! :reviewed, @transmit
    @transmit.reviewing!
    respond_to do |format|
      format.js
      format.html { redirect_to location_unit_project_transmit(@location, @unit, @project, @transmit) }
    end
  end

  def completed
    authorize! :completed, @transmit
    @transmit.complete!
    respond_to do |format|
      format.js
      format.html { redirect_to location_unit_project_transmit(@location, @unit, @project, @transmit) }
    end
  end

  def unsatisfactory
    authorize! :unsatisfactory, @transmit
    @transmit.incomplete!
    respond_to do |format|
      format.js
      format.html { redirect_to location_unit_project_transmit(@location, @unit, @project, @transmit) }
    end
  end


  private
  def transmit_params
    params.require(:transmit).permit(:name, :github_link, :heroku_link, :other_link, :content, :workflow_sate)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_location
    @location = Location.find params[:location_id]
  end

  def find_unit
    @unit = Unit.find params[:unit_id]
  end

  def find_project
    @project = Project.find params[:project_id]
  end

  def find_transmit
    @transmit = Transmit.find params[:id]
  end

  def find_comment
    @comment = @transmit.comments.find params[:comment_id]
  end
end