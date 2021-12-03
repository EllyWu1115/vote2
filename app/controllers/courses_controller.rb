class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end
  def create
        @course = Course.new(clean_params)
    if @course.save
    redirect_to courses_path
    else
    render :new
    end
  end  

  def show
    @course = Course.find_by(id: params[:id])
    
  end
  def edit
    @course = Course.find_by(id: params[:id])  
    
  end
  def update
    @course = Course.find_by(id: params[:id]) 
    if @course.present?
       @course.update(clean_params)
       redirect_to courses_path
    else
        render :edit
    end
  end
  def destroy
    @course = Course.find_by(id: params[:id])
    if @course.present?
       @course.destroy
    end
      redirect_to courses_path
  end

  def clean_params
    params.require(:course).permit(:name, :price, :intro, :hour)
  end
  
end
