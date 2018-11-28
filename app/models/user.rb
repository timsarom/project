class User < ApplicationRecord
	attr_accessor :current_password
	
	after_destroy :ensure_an_admin_remains
	has_secure_password

	validates :name, presence: true, uniqueness: true
	validate :current_password_check, if: :validate_password?, on: :update

	def validate_password?
    	!password.blank?
  	end

	def current_password_check
		if User.find(id).authenticate(current_password) == false
			errors.add(:current_password, "is incorrect")
		end
	end

	class Error < StandardError
	end

	private

	def ensure_an_admin_remains
		if User.count.zero?
			raise Error.new "Can't delete last user"
		end
	end
end

