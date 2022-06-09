class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        membership = Membership.create!(params.permit(:gym_id, :client_id, :charge))
        render json: membership, status: :created
    end

    private

    def render_unprocessable_entity_response
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Membership not found" }, status: :not_found
    end
end
