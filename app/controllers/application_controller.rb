class ApplicationController < ActionController::Base
    before_action :configure_permitted_params, if: :devise_controller?

    protected 
    def configure_permitted_params
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name,  :photo, :email, :password, :password_confirmation, :current_password) }

    end

    def after_sign_out_path_for(resource_or_scope)
        root_path
    end

    def after_sign_up_path_for(resource)
        root_path
    end

    
end
