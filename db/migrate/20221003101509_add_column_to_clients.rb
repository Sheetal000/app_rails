class AddColumnToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :name, :string
    add_column :clients, :phone, :integer
    add_column :clients, :post_code, :integer
    add_column :clients, :city, :string
  end
end
