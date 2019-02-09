module ApplicationHelper
    def resource_name
        @resource_name ||= if client_controller?
          :client
        else
          :user
        end
      end
      
      def resource
        @resource ||= resource_name.to_s.classify.constantize.new
      end
      
      def devise_mapping
        @devise_mapping ||= Devise.mappings[resource_name]
      end
end
