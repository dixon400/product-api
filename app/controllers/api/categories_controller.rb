class Api::CategoriesController < ApplicationController
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
          render json: {error: "Category Not Found"}
        end
      end
    
      private
        def cat_params
          params.require(:category).permit([
            :name,
            :created_by
        ])
       end
        

end
