require "application_system_test_case"

class ApplicationTest < ApplicationSystemTestCase
	test "error occured" do
		error = "Trying to access unexisting object"

		mail = ApplicationMailer.application_error(error)
		assert_equal ["depot@example.com"],					mail.to
		assert_equal 'from@example.com',					mail[:from].value
		assert_equal 'Application error occured', 			mail.subject
	end
end