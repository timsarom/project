class RemoveCurrencyFromProducts < ActiveRecord::Migration[5.1]
  def change
  	remove_column :products, :currency, :string
  end
end
