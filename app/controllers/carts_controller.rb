class CartsController < ApplicationController
    before_action :authenticate_client!

    def index
        parent_id = Parent.find_by(client_id: current_client.id).id
        @carts = Cart.where(parent_id: parent_id)
        @courses = Course.all
        @centres = Centre.all
    end
end