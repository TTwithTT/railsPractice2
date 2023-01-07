class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	
	def configure_permitted_parameters
		added_attrs = [ :name, :email, :password, :introdcution]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs 
	end

	private
	# def after_sign_in_path_for(resource)
	# end
	
	# def after_sign_out_path_for(resource)
	# end
end
