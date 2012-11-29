class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # just show a flash message instead of full CanCan exception
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You are not authorized to take this action.  Go away or I shall taunt you a second time."
    redirect_to home_path
  end

  def set_controller_and_action_names
    @current_controller = controller_name
    @current_action = action_name
  end

  private
  # Handling authentication
  #don't need this for devise
  #def current_user
   # @current_user ||= User.find(session[:user_id]) if session[:user_id]
 # end
 #helper_method :current_user

  #def logged_in?
  #  current_user
  #end
  #helper_method :logged_in?

 # def check_login
  #  redirect_to login_url, alert: "You need to log in to view this page." if current_user.nil?
  #end
  
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'ETag'
    headers['Access-Control-Allow-Credentials'] = true
    headers['Access-Control-Allow-Headers'] = '*, X-Requested-By, X-Requested-With, X-Prototype-Version, X-CSRF-Token, Content-Type'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, DELETE, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

# If this is a preflight OPTIONS request, then short-circuit the
# request, return only the necessary headers and return an empty
# text/plain.

  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = '*, X-Requested-By, X-Requested-With, X-Prototype-Version, X-CSRF-Token, Content-Type'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end
end
