ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
 fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
	Rails.application.load_seed
	def login_as(user)
		post login_url, params: { name: user.name, password: 'secret' }
	end

	def logout
		delete logout_url
	end

	def setup
		login_as users(:one)
		@headers = { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('dave', 'secret') }
	end
end
