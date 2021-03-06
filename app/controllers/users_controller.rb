class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login, :index]

  # REGISTER
  def create
    if User.find_by(email: params[:email])
      render json: { error: "This email is already in use" }
    else
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid email or password"}
      end
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid email or password"}
    end
  end


  def auto_login
    render json: @user
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  private

  def user_params
    params.permit(:fname, :lname, :email, :zipCode, :password)
  end

end