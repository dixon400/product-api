class Product < ApplicationRecord
    belongs_to :category
    belongs_to :user, foreign_key: :created_by
end
