class Parent < ApplicationRecord
    belongs_to :client 
    has_many :carts
end
