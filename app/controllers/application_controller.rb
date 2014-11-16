class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def authenticate_user!
    if user_signed_in?
      super     
    else
      redirect_to new_user_session_path,
        :notice => 'You must be logged in to access this page.'
    end
  end
  
  def authenticate_admin!
    if user_signed_in? && current_user.is_admin
      authenticate_user!
    else
      redirect_to root_path,
        :notice => 'Only administrator can access this page.'
    end
  end
end
