require 'pdf-reader'

class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  # after_create :pdf_to_text

  def index
    if current_user.user_type = "Business"
      @documents = current_user.documents
    end
    if current_user.user_type = "Student"
      @documents = current_user.documents
    end
    if current_user.user_type = "Teacher"
      @documents = current_user.documents
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @document = Document.new
    @business = current_user
    @lessons = Lesson.all
  end

  def create
    @document = Document.new(document_params)
    @document.business = current_user
    @document.price_cents = 1000
    if @document.save
      set_original_content
      create_sections
      create_order
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @sections = @document.sections.order(:order)
    @students = @document.lesson.students
    if params[:section]
      @section = Section.find(params[:section])
    end
    respond_to do |format|
      format.html
      format.js
    end
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
    redirect_to user_path
  end

  private

  def document_params

    params.require(:document).permit(:title, :original_content, :business, :lesson, :pdf, :lesson_id, :price_cents)
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

  def create_order
    Order.create(amount: @document.price, state: 'pending', user: current_user, document: @document)
  end

  def create_sections
    @students = @document.lesson.students.order('random()')
    # @section = Section.new(section_params)
    @document.reload
    io = open(Cloudinary::Utils.cloudinary_url(@document.pdf))
    reader = PDF::Reader.new(io)

    sentence_array = []
    reader.pages.each do |page|
      clean = page.text.delete("\n")
      sentence_array << clean.scan(/[^\.\!\?]*[\.\!\?]/)
    end

    sentences = sentence_array.flatten

    number_of_sentences = sentences.count

    x = number_of_sentences / @students.count

    h = Hash[@students.map {|student| [student, x]}]

    remainder = number_of_sentences % @students.count

    if remainder != 0
      students_dup = h.dup
      unlucky_students = h.dup
      (@students.count - remainder).times do
        random_student = students_dup.keys.sample
        unlucky_students.delete(random_student)
        students_dup.delete(random_student)
      end

      unlucky_students.each do |student, _count|
        h[student] += 1
      end
    end

    sections = []

    h.values.each do |num|
      part = sentences.slice(0, num)
      sentences -= part
      sections << part
    end
    p sections

    new_hash = {}
    @students.each do |student|
      section = sections.first
      new_hash[student.id.to_s] = section
      sections.delete(section)
    end

    counter = 1
    new_hash.each do |k,v|
      section = Section.new(document: @document, order: counter)
      section.student = User.find(k.to_i)
      section.original_content = v
      section.save!
      counter += 1
    end

    # for each key value pair
    # Section.new(sentences, docs, student_id)
  end


 {
  content: [ ],
  order: 4
 }

   def set_original_content

    @document.reload
    io = open(Cloudinary::Utils.cloudinary_url(@document.pdf))
    reader = PDF::Reader.new(io)

    sentence_array = []
    reader.pages.each do |page|
      clean = page.text.delete("\n")
      sentence_array << page.text.scan(/[^\.\!\?]*[\.\!\?]/)
    end

    sentences = sentence_array.flatten

    @document.original_content = sentences.join

    @document.save!

   end


end
