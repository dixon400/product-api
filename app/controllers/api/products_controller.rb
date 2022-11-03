class Api::ProductsController < ApplicationController
    def index
        products = Product.all
        render json: products, include: :category, status: 200
      end
    
      def create
        product = Product.new(
          name: prod_params[:name],
          brand: prod_params[:brand],
          price: prod_params[:price],
          description: prod_params[:description],
          category_id: prod_params[:category_id],
          created_by: prod_params[:created_by]

        )

        product.save
          render json: product, status: 200
        rescue ActiveRecord::RecordInvalid => e
          render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
      end
    
      def show
        product = Product.find_by(id: params[:id])
        if product
          render json: product, status: 200
        else
          render json: {error: "Product Not Found"}
        end
      end
    
      private
        def prod_params
          params.require(:product).permit([
            :name,
            :brand,
            :price,
            :description,
            :category_id,
            :created_by
        ])
       end
end
