class ApplicationController < ActionController::Base
    # after_action :set_csrf_cookie

    private
    # enable these for prod CSRF refreshes on each request
    # def set_csrf_cookie
    #   cookies["CSRF-TOKEN"] = {
    #     value: form_authenticity_token,
    #     secure: true,
    #     same_site: :strict,
    #     domain: 'localhost'
    #   }
    # end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end
end
