class Admin::ProjectsController < Admin::BaseController
  respond_to :html, :js

  def index
    @projects = Project.all
      respond_to do |format|
        format.html
        format.json
      end
  end
  
  def show
    @project = Project.find_by_id(params[:id]) 
    @todos = @project.todos
    @users = @project.users
  end
  def new
    @project = Project.new
  end
  
  def create
    @projects = Project.all
    @project = Project.create(project_params)
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  
    respond_to do |format|
      format.html { redirect_to(admin_projects_path) }
    end
  end
  
  def assign_project
    project = Project.find_by_id(params[:id])
    user = User.find_by_id(params[:user_id])
    project.users << user unless project.users.include?(user)
    project.save!
    redirect_to(:back)
    # render json: project
  end

  def charts
    @projects = Project.all
  end

  def status
    @projects = Project.all
  end
private
  def project_params
    params.require(:project).permit!
  end
end
