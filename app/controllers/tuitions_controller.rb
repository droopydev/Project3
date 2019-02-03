class TuitionsController < ApplicationController
    def index
        @tuitions = Tuition.all
    end
  
    def show
        @tuition = Tuition.find(params[:id])
    end
  
    def new
    end
  
    def edit
        @tuition = Tuition.find(params[:id])
    end
  
    def create
        @tuition = Tuition.new(tuition_params)
      
        @tuition.save
        redirect_to @tuition
    end
  
    def update
    @tuition = Tuition.find(params[:id])
    
    @tuition.update(tuition_params)
    redirect_to @tuition
    end
  
    def destroy
        @tuition = Tuition.find(params[:id])
        @tuition.destroy
      
        redirect_to root_path
    end

    private
    def tuition_params
        params.require(:tuition).permit(:centre_name, :reg_no, :contact_no, :location, :description, :avatar)
    end
  end