class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :seller
  has_and_belongs_to_many :products

  # Define scopes for filtering and searching
  scope :by_customer_name, ->(name) { joins(:customer).where('customers.name LIKE ?', "%#{name}%") }
  scope :by_seller_name, ->(name) { joins(:seller).where('sellers.name LIKE ?', "%#{name}%") }
  scope :by_order_date, ->(date) { where(order_date: date) }
  scope :by_amount, ->(amount) { where(amount: amount) }

  # Use Ransack for more complex searching and filtering
  def self.ransackable_scopes(auth_object = nil)
    %i(by_customer_name by_seller_name by_order_date by_amount)
  end
  
end
