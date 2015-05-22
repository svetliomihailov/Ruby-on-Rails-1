class TasksController < ApplicationController
  before_filter :set_task, only: [:edit, :show, :update, :destroy]

  def index
    set_lecture
    @tasks = @lecture.tasks
  end

  def show
  end
 
  def edit
  end

  def new
    set_lecture
    @task = @lecture.tasks.build
  end

  def create
    set_lecture
    @task = Task.new task_params
    @task.lecture = @lecture

    respond_to do |format|
      if @task.save
        format.html { redirect_to lecture_tasks_path(@lecture), notice: 'Task was successfully created.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to lecture_tasks_url(@task.lecture), notice: 'Task was successfully destroyed' }
    end
  end

  def update
    respond_to do |format|
      if @task.update task_params
        format.html { redirect_to lecture_tasks_path(@task.lecture), notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_task
    @task = Task.find params[:id]
  end

  def set_lecture
    @lecture = Lecture.find params[:lecture_id]
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
