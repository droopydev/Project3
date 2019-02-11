class CartsController < ApplicationController
    before_action :authenticate_client!
    
    def edit
        @cart = Cart.find(params[:id])
        @course = Course.find_by(id: @cart.course_id)
        if @cart.parent_id != parent_id
            redirect_to error_path
        end
    end

    def update
        @cart = Cart.find(params[:id]) 
        @cart.update(cart_params)
        redirect_to overview_path
    end
    
    def destroy 
        @cart = Cart.find(params[:id])
        byebug
        @cart.destroy
        
        redirect_to overview_path
    end
    
    private
    def parent_id
        return Parent.find_by(client_id: current_client.id).id
    end

    def cart_params
        params.require(:cart).permit(:centre_id)
    end
end