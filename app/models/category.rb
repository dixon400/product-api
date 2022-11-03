class Category < ApplicationRecord
    belongs_to :user, foreign_key: :created_by
    has_many :products
end
