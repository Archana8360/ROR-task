class ProductIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :product, foreign_key: true
  end
end
