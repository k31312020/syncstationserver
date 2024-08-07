class ApplicationController < ActionController::Base
    include RenderErrorsHandler
    # after_action :set_csrf_cookie
    include Pagy::Backend
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

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
