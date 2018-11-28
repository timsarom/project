require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
	include ActiveJob::TestHelper

	def setup
		Rails.application.load_seed
	end

	test "check full order" do
		LineItem.delete_all
		Order.delete_all

		visit store_index_url

		first('.catalog li').click_on 'Add to Cart'

		click_on 'Checkout'

		fill_in 'order_name', with: 'Dave Thomas'
		fill_in 'order_address', with: '123 Main Street'
		fill_in 'order_email', with: 'dave@example.com'

		assert_no_selector "#order_credit_card_number"
		assert_no_selector "#order_expiration_date"
		select 'Credit Card', from: 'pay_type'
		assert_selector "#order_credit_card_number"
		assert_selector "#order_expiration_date"

		assert_no_selector "#order_po_number"
		select 'Purchase Order', from: 'pay_type'
		assert_selector "#order_po_number"

		assert_no_selector "#order_routing_number"
		assert_no_selector "#order_account_number"
		select 'Check', from: 'pay_type'
		assert_selector "#order_routing_number"
		assert_selector "#order_account_number"

		fill_in "Routing #", with: "123456"
		fill_in "Account #", with: "987654"

		perform_enqueued_jobs do
			click_button "Place Order"
		end

		orders = Order.all
		assert_equal 1, orders.size

		order = orders.first

		assert_equal "Dave Thomas", 	 order.name
		assert_equal "123 Main Street",  order.address
		assert_equal "dave@example.com", order.email
		assert_equal 1,			 		 order.pay_type_id
		assert_equal 1, order.line_items.size
	
		mail = ActionMailer::Base.deliveries.last
		assert_equal ['dave@example.com'],					mail.to
		assert_equal 'Sam Ruby <depot@example.com>',		mail[:from].value
		assert_equal 'Pragmatic Store Order Confirmation', 	mail.subject
	end

	test "perform enqueued job for ship date" do
		visit orders_path

		fill_in 'Name:', with: "dave"
		fill_in 'Password:', with: "secret"

		click_button 'Login'

		visit orders_path

		perform_enqueued_jobs do
			click_on 'Ship'
		end

		visit store_index_url

		assert_equal 1, enqueued_jobs.size
	end

	test "shipped mail info" do
		shipped = "Pragmatic Store Order Shipped"

		mail = ApplicationMailer.application_error(shipped)
		assert_equal ["depot@example.com"],					mail.to
		assert_equal 'from@example.com',					mail[:from].value
		assert_equal 'Application error occured', 			mail.subject
	end

	test "check unsuccessful payment info" do
		LineItem.delete_all
		Order.delete_all

		visit store_index_url

		first('.catalog li').click_on 'Add to Cart'

		click_on 'Checkout'

		fill_in 'order_name', with: 'Dave Thomas'
		fill_in 'order_address', with: '123 Main Street'
		fill_in 'order_email', with: 'dave@example.com'

		select 'Purchase Order', from: 'pay_type'

		fill_in 'PO #', with: "123"

		perform_enqueued_jobs do
			click_button "Place Order"
		end

		mail = ActionMailer::Base.deliveries.last
		assert_equal ['dave@example.com'],					mail.to
		assert_equal 'Sam Ruby <depot@example.com>',		mail[:from].value
		assert_equal 'Pragmatic Store Order Failure', 		mail.subject
	end
end