class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.teacher = current_user
    if lesson.save
      render root_path
    else
      render :new
    end
  end


  private
  def lesson_params
    params.require(:lesson).permit(:lesson_name, :description, :teacher)
  end

end
