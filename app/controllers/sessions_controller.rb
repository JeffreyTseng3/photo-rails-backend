class SessionsController < ApplicationController  
  
  def create
  
    # if @user = User.authenticate(session_params[:username], 
    #                              session_params[:password])

    #   session[:user_id] = @user.id
    #   render status: :created
    # else

    #   render json: { error: 'Invalid credentials' }, 
    #          status: :unauthorized
    # end
    @user = User.find_by_credentials(
        # keyinginto info to return an email or username
        session_params[:username],
        session_params[:password]
      )

      if @user
        # render is the return of the api request
        login!(@user)
        # render "api/users/show"
      render status: :created

      else
        render json: ["Invalid username/password combination"], status: 401
      end
  end

  def destroy
    # session[:user_id] = nil
    # head :ok
      @user = current_user
      if @user
        logout!
        
      else
        render json: ["No one is signed in"], status: 404
      end
  end

private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
