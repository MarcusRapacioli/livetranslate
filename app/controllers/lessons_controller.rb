class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show,:edit, :update, :destroy]
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.teacher = current_user
    if @lesson.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @lesson.destroy
    redirect_to root_path
  end

  private
  def lesson_params
    params.require(:lesson).permit(:lesson_name, :description, :teacher)
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

end
