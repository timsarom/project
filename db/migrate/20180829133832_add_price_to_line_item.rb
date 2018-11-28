class AddPriceToLineItem < ActiveRecord::Migration[5.0]
  def change
  	add_column :line_items, :price, :decimal
  	LineItem.all.each do |li|
  		li.price = li.product.price
  	end
  end
end
