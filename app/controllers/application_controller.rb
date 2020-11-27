class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

 private

 def user_not_authorized(exception)
   policy_name = exception.policy.class.to_s.underscore

   flash[:alert] = "You are not authorized to perform this action"
   redirect_to(request.referrer || root_path)
 end
end
