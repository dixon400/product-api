class Api::UsersController < ApplicationController
    def index
        users = User.all
        render json: users, status: 200
      end
    
      def create
        user = User.new(
          name: user_params[:name],
          email: user_params[:email]

        )
        if user.save
          render json: user, status: 200
        else
          render json: {error: "Error creating data"}
        end
      end
    
      def show
        user = User.find_by(id: params[:id])
        if user
          render json: user, status: 200
        else
          render json: {error: "Category Not Found"}
        end
      end

      def delete
        user = User.find_by(id: params[:id])
        
      end
    
      private
        def user_params
          params.require(:user).permit([
            :name,
            :email
        ])
       end
        

end
