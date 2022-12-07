class SessionsController < ApplicationController
  def signup
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user }, status: :ok
    else
      render json: { error: 'Usuário ou senha inválidos' }, 
      status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
        token = encode_token({ user_id: @user.id })
        session[:current_user_id] = @user.id
        session[:current_username] = @user.username       
        render json: { token: token }, status: :ok
    else
        render json: { error: 'Usuário ou senha inválidos' }, 
        status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
