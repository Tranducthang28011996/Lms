class Admin::LessonsController < ApplicationController
  before_action :authenticate_user

  # Some code here
  def index
    @lessons = Lesson.includes(:course).all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to admin_lessons_path
    else
      render 'new'#, flash: {error: 'Error'}
    end

  end

  private
  def lesson_params
    params.require(:lesson).permit(:name, :document_url, :video_url, :description, :course_id)
  end
end