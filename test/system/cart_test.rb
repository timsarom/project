require "application_system_test_case"

class CartTest < ApplicationSystemTestCase
	test "reveal and hide the cart" do
		visit store_index_url

		assert_no_selector('h2', text: 'Your Cart')
		first('.catalog li').click_on 'Add to Cart'
		assert_no_selector('h2', text: 'Your Cart')

		accept_alert do
			click_button('Empty cart')
		end
		
		assert_no_selector('h2', text: 'Your Cart')
	end

	test "line-item highlight feature" do
		visit store_index_url

		assert_no_selector('.line-item-highlight')

		first('.catalog li').click_on 'Add to Cart'

		assert_selector('.line-item-highlight')
	end
end