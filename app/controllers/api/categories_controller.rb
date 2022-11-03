class Api::CategoriesController < ApplicationController
      before_action :authorize

  
      def index
        categories = Category.all
        render json: categories, include: :user,  status: 200
      end
    
      def create
        category = Category.new(
          name: cat_params[:name],
          created_by: cat_params[:created_by]

        )
        if category.save
          render json: category, status: 200
        else
          render json: {error: "Error creating data"}
        end
      end
    
      def show
        category = Category.find_by(id: params[:id])
        if category
          render json: category, status: 200
        else
          render_not_found_response
        end
      end
    
      private
        def cat_params
          params.require(:category).permit([
            :name,
            :created_by
        ])
       end
        
       def render_not_found_response
        render json: { error: "Category not found" }, status: :not_found
      end

      def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
      end

end
