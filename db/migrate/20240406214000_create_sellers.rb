class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :mobile
      t.string :address
      t.string :state
      t.integer :pincode
      t.string :city
      t.string  :country
      t.references :user, foreign_key: { to_table: :users }, index: true 

    end
  end
end
