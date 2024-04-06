class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :amount
      t.references :seller, foreign_key: { to_table: :sellers }, index: true 

      t.timestamps
    end
  end
end
