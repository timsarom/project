class AddShipDateToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :ship_date, :date
  end
end
