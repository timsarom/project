class AddCurrencyToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :currency, :string
  end
end
