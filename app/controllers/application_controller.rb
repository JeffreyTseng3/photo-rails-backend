class ApplicationController < ActionController::Base
  # before_action :set_csrf_cookie
  #  protect_from_forgery with: :null_session

  # rescue_from ActiveRecord::RecordNotFound do |e|
  #   render json: { error: "Not Found" }, status: :not_found
  # end

  # rescue_from ActionController::InvalidAuthenticityToken do |e|
  #   render json: { error: "Invalid token" }, status: :unauthorized
  # end

# private

#   def set_csrf_cookie
#     cookies["CSRF-TOKEN"] = form_authenticity_token
#   end

#   def authenticate_user
#     unless current_user
#       render json: { error: 'Requires authentication check' }, 
#              status: :unauthorized
#       return
#     end
#   end

#   def current_user
#     @current_user ||= User.find(session[:user_id]) if session[:user_id]
#   end




# protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?

    def current_user 
        return nil unless session[:session_token]
        @current_user ||= User.find_by_session_token(session[:session_token])
    end 
    
    def logged_in?
        !!current_user
    end

    def login!(user)
        @current_user = user 
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        current_user.reset_session_token! 
        session[:session_token] = nil 
        @current_user = nil 
    end

    def ensure_logged_in 
        # check the routes to see if need /api/
        # redirect_to new_session_url unless logged_in? 
    end

end
