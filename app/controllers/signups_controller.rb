class SignupsController < ApplicationController

    def create
        signup = Signup.new(signup_params)
        if signup.save
            render json: signup, status: :created
        else
            render json: { error: "validation errors"}, status: :unprocessable_entity
        end
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

end
