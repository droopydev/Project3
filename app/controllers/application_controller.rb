class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
          if resource.is_a?(User) 
               '/dashboard'
          else
               '/parents'
          end
   end


   def client_controller?
     !devise_controller? and request.path =~ /^\/client/
   end
   helper_method :client_controller?

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:company_name, :email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:company_name, :email, :password, :current_password)}
         end

end