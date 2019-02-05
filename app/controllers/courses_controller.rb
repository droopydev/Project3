class CoursesController < ApplicationController
    before_action :authenticate_user!
    def index
        @courses = Course.where(user_id: current_user.id)
    end

    def new
        @centres = Centre.where(user_id: current_user.id)
    end
    
    def show
        @course = Course.find(params[:id])
        if @course.user_id != current_user.id
            redirect_to error_path
        end
    end

    def create
        @course = Course.new(course_params)
        @course.user_id  = current_user.id
        @course.save
        redirect_to '/centres'
    end

    def edit
        @course = Course.find(params[:id])
        if @course.user_id != current_user.id
            redirect_to error_path
        end
    end

    def update
        @course = Course.find(params[:id])
        
        @course.update(tuition_params)
        redirect_to @course
    end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
      
        redirect_to centres_path
    end

    private
    def course_params
        params.require(:course).permit(:course_name, :description, :age, :category, :credits, :avatar, :centre_ids => [])
    end
end