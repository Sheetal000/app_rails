class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new 
    @students = Student.new
  end

  def show
   @students = Student.find(params[:id])
   
  end
end
