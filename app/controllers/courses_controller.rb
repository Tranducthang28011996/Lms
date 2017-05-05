class CoursesController < ApplicationController
	before_action :authenticate_user, except: [:index, :auto_complete, :search]
	def index
		if session[:current_user_id]
			@current_user = User.where(id: session[:current_user_id]).first
		end

		@enrolled_courses = @current_user ? @current_user.courses : []
		enrolled_course_ids = @enrolled_courses.size > 0 ? @enrolled_courses.select(:id) : []
		@courses = Course.where.not(id: enrolled_course_ids)
	end

  def dashboard

		@enrolled_courses = @current_user.courses.where(
														course_students: { status: 'approved' }
												)

	end

  def enroll
		@course = Course.find(params[:id])

		if @current_user.courses.include? @course
			respond_to do |format|
				format.json { render json: {}, status: 400 }
				format.js
			end
		else
			@current_user.courses << @course
			respond_to do |format|
				format.json { render :json => {course: @course}, status: :ok }
				format.js
			end
		end
	end

  def search
		@courses = Course.search(params[:query])
		render :index
	end

  def show
		@course = Course.find(params[:id])
		@lessons = @course.lessons

	end

  def auto_complete
		render json: Course.search(params[:query], limit: 10).map(&:name)
	end
end