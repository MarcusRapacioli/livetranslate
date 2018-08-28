class StudentLessonsController < ApplicationController

  def new
    @student_lesson = StudentLesson.new
  end

  def create
    @student_lesson = StudentLesson.new(student_lesson_params)
    @student_lesson.student = User.find(params[:student_lesson][:user_id].to_i)
    @student_lesson.lesson = Lesson.find(params[:student_lesson][:lesson_id].to_i)
    if @student_lesson.save!
     redirect_to lesson_path(@student_lesson.lesson)
    end
  end




private
  def student_lesson_params
    params.require(:student_lesson).permit(:student, :lesson)
  end
end
