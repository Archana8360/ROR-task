class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :seller
  has_and_belongs_to_many :products

  enum user_type:{
    admin: 0,
    seller: 1,
    customer: 2
  }

  def customer
    # Return the associated customer for this order
    # Assuming you have a 'customer' association defined
    self.customer_id
  end

  def seller
    # Return the associated seller for this order
    # Assuming you have a 'seller' association defined
    self.seller_id
  end
  
end
