class Users::RegistrationsController < Devise::RegistrationsController
  protected
  
  def after_update_path_for(resource)
    user_path(resource) 
  end

  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    resource.update_without_password(params)
  end
end
  