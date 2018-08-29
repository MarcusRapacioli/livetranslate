class SectionsController < ApplicationController
  before_action :set_document, only: [:index, :new, :create, :edit, :show]

  def index
    @sections = @document.sections
  end

  def show
  end

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


  private

  def section_params
    params.require(:section).permit(:original_content, :status, :user_id )
  end

  def split_document

  end

  def set_document
    @document = Document.find(params[:document_id])
  end

end
