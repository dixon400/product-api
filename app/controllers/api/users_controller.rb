class Api::UsersController < ApplicationController
    before_action :authorize
    skip_before_action :authorize, only: [:create]

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
          render_not_found_response
        end
      end

      def delete
        user = User.find_by(id: params[:id])
        if(user)
          user.destroy
          head :no_content
        else
          render_not_found_response
        end
      end
    
      private
        def user_params
          params.require(:user).permit([
            :name,
            :email
        ])
       end
      
       def render_not_found_response
        render json: { error: "Product not found" }, status: :not_found
      end
      
      def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
      end
end
