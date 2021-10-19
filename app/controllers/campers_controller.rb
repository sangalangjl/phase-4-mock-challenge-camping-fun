class CampersController < ApplicationController

    # GET /campers
    def index
        campers = Camper.all
        render json: campers
    end

    # GET /campers/:id
    def show
        camper = Camper.find(params[:id])
        if camper
            render json: camper, status: :ok
        else
            render json: { error: "Camper not found"}, status: :not_found
        end
    end

    # POST /campers
    def create
        camper = Camper.new(camper_params)
        if camper.save
            render json: camper, status: :created
        else
            render json: { error: "validation errors"}, status: :unprocessable_entity
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

end
