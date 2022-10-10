class Products < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
    t.string :product_name
    t.string :product_type
    t.decimal :product_price
    t.timestamps
    end
  end
end
