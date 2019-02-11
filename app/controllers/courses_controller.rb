class CoursesController < ApplicationController
    before_action :authenticate_user!, :except => [:index, :show, :apply, :applycreate]
    before_action :authenticate_client!, :only => [:apply, :applycreate]

    def index
        if user_signed_in?
            @courses = Course.where(user_id: current_user.id)
        else
            @courses = Course.all
        end
    end

    def new
        @centres = Centre.where(user_id: current_user.id)
        @course = Course.new
    end
    
    def show
        if user_signed_in?
            @course = Course.find(params[:id])
            @centres = Centre.where(user_id: current_user.id)
            if @course.user_id != current_user.id
                redirect_to error_path
            end

        else
            @course = Course.find(params[:id])
        end
    end

    def create
        @centres = Centre.where(user_id: current_user.id)
        @course = Course.new(course_params)
        @course.user_id  = current_user.id
        if @course.save
            redirect_to courses_path
        else
            render 'new'
        end
    end

    def edit
        @course = Course.find(params[:id])
        @centres = Centre.where(user_id: current_user.id)
        if @course.user_id != current_user.id
            redirect_to error_path
        end
    end

    def update
        @course = Course.find(params[:id])
        @centres = Centre.where(user_id: current_user.id)
        
        if @course.update(course_params)
            redirect_to @course
        else
            render 'edit'
        end
    end

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
      
        redirect_to courses_path
    end

    def apply
        @course = Course.find(params[:id]) 
    end
 
    def applycreate
        @cart = Cart.new(cart_params)
        @cart.course_id = params[:id]
        parent_id = Parent.find_by(client_id: current_client.id).id
        @cart.parent_id = parent_id
        @cart.save
        
        redirect_to carts_path
    end

    private
    def course_params
        params.require(:course).permit(:course_name, :description, :age, :category, :credits, :avatar, :centre_ids => [])
    end

    def cart_params
        params.require(:cart).permit(:centre_id)
    end
end