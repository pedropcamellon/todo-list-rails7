class TasksController < ApplicationController
  before_action :set_project

  # POST /tasks or /tasks.json
  def create
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

    private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_project
        @project = Project.find(params[:project_id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:content)
    end
end
