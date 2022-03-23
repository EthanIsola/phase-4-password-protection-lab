class UserController < ApplicationController

    def create
        if (params[:password] != nil) && (params[:password] === params[:password_confirmation])
            user = User.create!(user_params)
            session[:user_id] = user.id
            render json: user
        else
            render json: { error: "Password can't be blank" }, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
