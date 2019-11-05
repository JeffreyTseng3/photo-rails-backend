class UsersController < ApplicationController
  
  wrap_parameters :user, include: [:username, :password]

  def index
    @users = User.all
  end

  def create
    # @user = User.new(user_params)
    # if @user.save
    #   session[:user_id] = @user.id
    #   render status: :created
    # else
    #   render json: { errors: @user.errors }, status: :unprocessable_entity
    # end
      if @user.save
 
      login!(@user)
      render status: :created
    else
    
      render json: @user.errors.full_messages, status: 422
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
