xml.order.list(:for_product => @product.title) do
	@product.orders each do |order|
		xml.order do
			xml.name(order.name)
			xml.email(order.email)
		end
	end
end