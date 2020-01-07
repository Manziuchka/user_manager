module Api
    module V1
        class UsersController < ApplicationController
            skip_forgery_protection
            before_action :authorize_request, except: :create

            # GET /api/v1/users
            def index
                @users = User.all
                render json: @users, status: :ok 
            end

            # GET /api/v1/users/:id
            def show
                @user = User.find(params[:id])
                render json: @user, status: :ok 
            end

            # POST /api/v1/users
            def create
                @user = User.new(user_params)
                if @user.save
                  render json: @user, status: :created
                else
                  render json: { errors: @user.errors.full_messages },
                  status: :unprocessable_entity
                end
            end

            # PATCH /api/v1/users/:id
            def update
                if @current_user.update(user_params)
                    render json: @current_user, status: :ok
                else
                    render json: { errors: @user.errors.full_messages },
                    status: :unprocessable_entity
                end
            end

            private

            def user_params
                params.require(:user).permit(:name, :email, :password, :avatar)
            end
        end
    end
end
