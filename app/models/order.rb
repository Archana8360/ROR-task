class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :seller
  has_and_belongs_to_many :products
  
end
