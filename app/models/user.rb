class User < ApplicationRecord
    has_many :categories 
    has_many :products 
end
