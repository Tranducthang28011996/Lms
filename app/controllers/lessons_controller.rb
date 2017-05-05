class LessonsController < ApplicationController
  before_action :authenticate_user

  def show
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
  end

end