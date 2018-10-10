# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.test?
  def protect_against_forgery?
    false
  end
end

if Rails.env.development?
  def protect_against_forgery?
    false
  end
end