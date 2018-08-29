class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  # after_create :pdf_to_text

  def index
    if current_user.user_type = "Business"
      @documents = current_user.documents
    end
  end

  def show
  end

  def new
    @document = Document.new
    @business = current_user
    @lessons = Lesson.all
  end

  def create
    @document = Document.new(document_params)
    @document.lesson = Lesson.find(params[:document][:lesson_id].to_i)
    @document.business = current_user
    if @document.save!
      redirect_to document_path(@document)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @document.update(document_params)
      redirect_to document_path(@document)
    else
      render :edit
    end
  end

  def destroy
    @document.destroy
    redirect_to root_path

  end

  private

  def document_params

    params.require(:document).permit(:title, :original_content, :business, :lesson)
  end

  def set_document
    @document = Document.find(params[:id])
  end

  def pdf_to_text
    reader = PDF::Reader.new("lorem.pdf")
      reader.pages.each do |page|
      puts page.text
      end
  end

  def text_split

  end




end
