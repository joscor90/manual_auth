module ApplicationHelper

    protected
    def current_user 
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged? 
        session[:user_id].present?
    end
end
