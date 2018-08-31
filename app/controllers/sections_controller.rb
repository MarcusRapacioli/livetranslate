class SectionsController < ApplicationController

  before_action :set_document, only: [:index, :new, :update, :create, :edit, :show, :destroy]
  before_action :set_section, only: [:edit, :update, :show, :destroy]

  def index
    @sections = @document.sections
  end

  def show
    unordered = @document.sections
    @sections = unordered.order(:id)
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
    @sections = @document.sections.order(:order)
    @students = @document.lesson.students

  end

  def update
    if @section.final_content?
         @section.status = "Complete"
    end
    if @section.update(section_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @section.destroy
    redirect_to document_sections_path(@document)
  end



  private

  def section_params
    params.require(:section).permit(:document_id, :final_content, :status)
  end

  def set_section
    @section = Section.find(params[:id])
  end

  def set_document
    @document = Document.find(params[:document_id])
  end

end
