class Api::SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
      if(user) 
        session[:user_id] = user.id
        render json: {user:user, session:session}
      else
        render json: {error: "No user found"}, status: 400
        
      end
      
    end

    def destroy
      session.delete :user_id
      head :no_content
    end
end