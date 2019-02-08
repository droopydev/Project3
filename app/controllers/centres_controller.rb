class CentresController < ApplicationController

    before_action :authenticate_user!, :except => [:homepage, :error]

    def homepage
    end

    def dashboard
        @centres = Centre.where(user_id: current_user.id)
        @courses = Course.where(user_id: current_user.id)
    end
    
    def index
        @centres = Centre.where(user_id: current_user.id)
    end
  
    def show
        @centre = Centre.find(params[:id])
        if @centre.user_id != current_user.id
            redirect_to error_path
        end
    end
  
    def new
        @courses = Course.where(user_id: current_user.id)
        @centre = Centre.new
    end
  
    def edit
        @centre = Centre.find(params[:id])
        @courses = Course.where(user_id: current_user.id)
        if @centre.user_id != current_user.id
            redirect_to error_path
        end
    end
  
    def create
        @centre = Centre.new(tuition_params)
        @centre.user_id = current_user.id
        if @centre.save
            redirect_to centres_path
        else
            render 'new'
        end 
    end
  
    def update
        @centre = Centre.find(params[:id])
        
        if @centre.update(tuition_params)
            redirect_to centres_path
        else
            render 'edit'
        end
    end
  
    def destroy
        @centre = Centre.find(params[:id])
        @centre.destroy
      
        redirect_to centres_path
    end

    def error
    end


    def remove_course
        @centre = Centre.find(params[:id])
        @centre.courses.delete(Course.find(params[:course_id]))
        redirect_to dashboard_path
    end

    private
    def tuition_params
        params.require(:centre).permit(:centre_name, :reg_no, :contact_no, :location, :description, :avatar, :course_ids => [])
    end
  end