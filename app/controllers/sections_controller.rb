class SectionsController < ApplicationController
  before_action :set_section, only: [:edit, :update, :destroy]


  def new
    @document = Document.find(params[:document_id])
    @section = Section.new
    @students = @document.lesson.students
  end

  def create
    @document = Document.find(params[:document_id])
    @section = Section.new(section_params)
    @section.document = @document
    # @section.original_content = @document
    # @section.student = @students.find(params[:section][:user_id])
    if @section.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update

  end


  private

  def section_params
    params.require(:section).permit(:original_content, :status, :user_id )
  end

  def set_section
    @section = Section.find(params[:id])
  end

end
