class CentresController < ApplicationController
    before_action :authenticate_user!, :except => [:homepage]
    def homepage
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
    end
  
    def edit
        @centre = Centre.find(params[:id])
        if @centre.user_id != current_user.id
            redirect_to error_path
        end
    end
  
    def create
        @centre = Centre.new(tuition_params)
        @centre.user_id = current_user.id
        @centre.save
        redirect_to @centre
    end
  
    def update
        @centre = Centre.find(params[:id])
        
        @centre.update(tuition_params)
        redirect_to @centre
    end
  
    def destroy
        @centre = Centre.find(params[:id])
        @centre.destroy
      
        redirect_to root_path
    end

    def error
        
    end

    private
    def tuition_params
        params.require(:centre).permit(:centre_name, :reg_no, :contact_no, :location, :description, :avatar)
    end
  end