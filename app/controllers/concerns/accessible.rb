module Accessible
    extend ActiveSupport::Concern
    included do
      before_action :check_user
    end
  
    protected
    def check_user
      if current_user
        flash.clear
        # if you have rails_user. You can redirect anywhere really
        redirect_to(dashboard_path) && return
      elsif current_client
        flash.clear
        # The authenticated root path can be defined in your routes.rb in: devise_scope :client do...
        redirect_to(parents_path) && return
      end
    end
  end