class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: Client.all
    end

    def show
        client = Client.find(params[:id])
        render json: client, serializer: AllMembershipSerializer
    end

    def update
        client = Client.find(params[:id])
        client.update(params.permit(:name, :age))
        render json: client
    end
         

    private

    def render_unprocessable_entity_response
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end
end
