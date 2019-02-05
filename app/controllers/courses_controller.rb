class CoursesController < ApplicationController
    before_action :authenticate_user!
    def index
        @courses = Course.where(user_id: current_user.id)
    end

    def new
        @centres = Centre.where(user_id: current_user.id)
    end
    
    def create
        @course = Course.new(course_params)
        byebug
        # @course.save
        @centre_course
    end

    private
    def course_params
        params.require(:course).permit(:course_name, :description, :age, :category, :credits)
    end
end