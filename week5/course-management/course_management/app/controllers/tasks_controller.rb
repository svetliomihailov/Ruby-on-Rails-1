class TasksController < ApplicationController
  before_filter :set_task, only: [:edit, :show, :update, :destroy]

  def index
    # @tasks = Task.all
    @tasks = []
    @lecture = Lecture.find params[:lecture_id]
  end

  def show
  end
 
  def edit
  end

  def new
    @task = Task.new
  end

  def create 
    @task = Task.new task_params

    respond_to do |format|
      if @task.save task_params
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Task was successfully destroied' }
    end
  end

  def update
    respond_to do |format|
      if @task.update task_params
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_task
    @task = Task.find params[:id]
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
