class StudentsController < ApplicationController
  def index
    if (params[:department_id] && params[:section_id] && params[:id])
      @student = Student.find(params[:id])
      @section = Section.find(params[:section_id])
      @department = Department.find(params[:department_id])
      render "show"
    elsif (params[:department_id] && params[:section_id])
      @students = Student.where(department_id: params[:department_id], section_id: params[:section_id]).all
    else
      @students = Student.all
    end
  end

  def new
    @student = Student.new
    @section_collection = Section.all.collect { |p| [p.name, p.id, p.department_id] }
    @department_collection = Department.all.collect { |p| [p.name, p.id] }
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to action: "index"
    else
      flash[:danger] = @student.errors.values.join(", ")
      render "new"
    end
  end

  def show
  end

  private

  def student_params
    params[:student].permit(:name, :email, :roll_no, :section_id, :department_id, :id)
  end
end
