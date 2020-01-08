class API::V1::AuthenticationController < ApplicationController
  protect_from_forgery with: :null_session

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.valid_password?(params[:password])
      @token = JsonWebToken.encode(user_id: @user.id)
      render :login, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
