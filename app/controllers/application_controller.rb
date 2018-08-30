class ApplicationController < ActionController::Base
  helper_method :is_admin?
    def is_admin?
        current_user.admin
    end
end
