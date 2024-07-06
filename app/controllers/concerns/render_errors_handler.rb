module RenderErrorsHandler
    extend ActiveSupport::Concern
    
    included do
        helper_method :render_not_found_response, :render_unprocessable_entity_response
    end

    def render_not_found_response
        render json: { errors: ["Record not found"] }, status: :not_found
    end
  
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end