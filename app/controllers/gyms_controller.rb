class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: Gym.all
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym
    end

    def update
        gym = Gym.find(params[:id])
        gym.update(params.permit(:name, :address))
        render json: gym
    end

    def destroy
        gym = Gym.find(params[:id])
        head :no_content
    end

    private

    def render_unprocessable_entity_response
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end
end
