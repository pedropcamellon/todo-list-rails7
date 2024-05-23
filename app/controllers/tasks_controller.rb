class TasksController < ApplicationController
  before_action :set_project

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to project_url(@project), notice: "Task was successfully added." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
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
