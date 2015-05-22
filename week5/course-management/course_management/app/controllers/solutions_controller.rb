class SolutionsController < ApplicationController
  before_filter :set_solution, only: [:edit, :show, :update, :destroy]

  def index
    set_lecture
    set_task
    @solutions = @task.solutions
  end

  def show
  end
 
  def edit
  end

  def new
    set_lecture
    set_task
    @solution = @task.solutions.build
  end

  def create
    set_lecture
    set_task
    @solution = Solution.new solution_params
    @solution.task = @task

    respond_to do |format|
      if @solution.save
        format.html { redirect_to lecture_task_solutions_path(@lecture, @task), notice: 'Solution was successfully created.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    set_lecture
    set_task
    @solution.destroy

    respond_to do |format|
      format.html { redirect_to lecture_task_solutions_path(@lecture, @task), notice: 'Solution was successfully destroyed' }
    end
  end

  def update
    respond_to do |format|
      if @solution.update solution_params
        format.html { redirect_to lecture_task_solutions_path(@lecture, @task), notice: 'Solution was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_solution
    @solution = Solution.find params[:id]
  end

  def set_lecture
    @lecture = Lecture.find params[:lecture_id]
  end

  def set_task
    @task = Task.find params[:task_id]
  end

  def solution_params
    params.require(:solution).permit(:content)
  end
end
