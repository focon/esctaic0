# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details



before_filter :require_no_member, :only => [:new, :create]
before_filter :require_member, :only => [:show,  :edit, :update]
# before_filter :require_member_admin, :only => [:destroy]

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation

 
helper :layout
helper_method :current_member,  :current_member_session

private

def current_member_session
  return @current_member_session if defined?(@current_member_session)
  @current_member_session = MemberSession.find
 end

def current_member
  return @current_member if defined?(@current_member)
  @current_member = current_member_session && current_member_session.record
 end


def require_member
      unless current_member
       store_location
       flash[:notice] = "You must be logged in to access this page"
      redirect_to new_member_session_url
      return false
    end
  end

    def require_no_member
     if current_member
       store_location
       flash[:notice] = "You must be logged out to access this page"
       redirect_to root_url
      return false
    end
   end
    
   def require_member_admin
 unless current_member.login == 'administrator'
 store_location
 flash[:notice] = "You must be logged as ‘administrator’ to access this function"
 redirect_to :back
 return false
 end
end
    
   def store_location
     session[:return_to] = request.request_uri
   end
  
   def redirect_back_or_default(default)
     redirect_to(session[:return_to] || default)
     session[:return_to] = nil
   end
end
