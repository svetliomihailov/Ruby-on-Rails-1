class LecturesController < ApplicationController
  before_filter :set_lecture, only: [:edit, :show, :update, :destroy]

  def index
    @lectures = Lecture.all
  end

  def show
  end
 
  def edit
  end

  def new
    @lecture = Lecture.new
  end

  def create 
    @lecture = Lecture.new lecture_params

    respond_to do |format|
      if @lecture.save lecture_params
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @lecture.destroy

    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Lecture was successfully destroied' }
    end
  end

  def update
    respond_to do |format|
      if @lecture.update lecture_params
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_lecture
    @lecture = Lecture.find params[:id]
  end

  def lecture_params
    params.require(:lecture).permit(:name, :body)
  end
end
