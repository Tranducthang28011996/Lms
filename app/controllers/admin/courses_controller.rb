class Admin::CoursesController < ApplicationController
  before_action :authenticate_user

  # Some code here
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @pending_requests = CourseStudent.where(course_id: params[:id], status: 'pending')
  end

  def approve
    course_student = CourseStudent.find(params[:request_id])
    course_student.update(status: 'approved')
    # Notifier.approve_course(course_student.student, course_student.course).deliver_now
    _student = {
        username: course_student.student.username,
        email: course_student.student.email
    }

    _course = {
      name: course_student.course.name
    }

    MailerJob.perform_later(_student, _course)
  end

  def new
    @course = Course.new
  end


  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course is created successful"
      redirect_to admin_courses_path
    else
      flash.now[:error] = @course.errors.full_messages
      render 'new'
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :image, :description)
  end

end