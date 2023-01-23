class UsersController < ApplicationController

    before_action :set_user, only: [:show]

    #GET /users
    def index
        @users = User.all
        render json: @users, status: :ok
    end

    #GET /users/:id
    def show
        render json: @user, status: :ok
    end

    #POST /user
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else 
            render json: @user.errors, status: :unprocessable_entity
        end 
    end

    private 

        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:username, :email, :password)
        end

end
