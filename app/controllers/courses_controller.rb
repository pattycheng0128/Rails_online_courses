class CoursesController < ApplicationController
  before_action :find_course, only: [:edit, :update, :destroy]
  before_action :authenticate!, except: [:index]

  def index
    @courses = Course.includes(:user)
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      redirect_to root_path, notice: "新增課程成功"
    else
      render :new, notice: "新增課程失敗"
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    if @course.present?
      @course.update(course_params)
      redirect_to root_path, notice: "修改課程成功"
    else
      render :eidt, notice: "修改課程失敗"
    end
  end

  def destroy
    if @course.present?
      @course.destroy
    end
    redirect_to root_path, notice: "刪除成功"
  end

  private
  def course_params
    params.require(:course).permit(:name, :price, :url, :description, :courses_type)
  end

  def find_course
    @course = current_user.courses.find(params[:id])
  end

end
