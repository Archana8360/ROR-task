class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :amount
      t.date :order_date
      t.integer :payment_id
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
