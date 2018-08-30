class SectionsController < ApplicationController

  before_action :set_document, only: [:index, :new, :update, :create, :edit, :show, :destroy]
  before_action :set_section, only: [:edit, :update, :show, :destroy]

  def index
    @sections = @document.sections
  end

  def show
  end

  def new
    @section = Section.new
    @students = @document.lesson.students
  end

  def create

  end
    # @section.original_content = @document
    # @section.student = @students.find(params[:section][:user_id])

  def edit
     @students = @document.lesson.students
  end

  def update
    if @section.update(section_params)
      redirect_to document_sections_path(@document)
    else
      render :edit
    end
  end

  def destroy
    @section.destroy
    redirect_to document_sections_path(@document)
  end

  def set_final(text)
    @section.final_content = text

  end


  private

  def section_params
    params.require(:section).permit(:document_id)
  end

  def set_section
    @section = Section.find(params[:id])
  end

  def set_document
    @document = Document.find(params[:document_id])
  end

  def set_section
    @section = Section.find(params[:id])
  end

end
