class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  helper_method :is_admin?
    def is_admin?
        current_user.admin
    end
end
