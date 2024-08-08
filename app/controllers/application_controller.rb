class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone_number, :full_name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:username, :phone_number, :full_name, :avatar])
	end

	def after_sign_in_path_for(resource)
    posts_path
  end

	def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
