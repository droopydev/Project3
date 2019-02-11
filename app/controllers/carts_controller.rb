class CartsController < ApplicationController
    before_action :authenticate_client!

    def index
        @carts = Cart.where(parent_id: parent_id)
        @courses = Course.all
        @centres = Centre.all
    end
    
    def edit
        @cart = Cart.find_by(id: params[:id])
        @course = Course.find_by(id: @cart.course_id)
        if @cart.parent_id != parent_id
            redirect_to error_path
        end
    end

    def update
        byebug
        @cart = Cart.find_by(id: params[:id]) 
        @cart.update(cart_params)
        redirect_to carts_path
    end
    
    def destroy
    end
    
    private
    def parent_id
        return Parent.find_by(client_id: current_client.id).id
    end

    def cart_params
        params.require(:cart).permit(:centre_id)
    end
end