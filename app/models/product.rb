class Product < ApplicationRecord
	include ActiveModel::Serializers::Xml
	has_many :line_items
	has_many :orders, through: :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :description, :image_url, presence: { message: 'field must be filled with valid data'}
	validates :price, numericality: { greater_than_or_equal_to: 0.01, message: "field must contain number, which ir larger than 0.01" }
	validates :title, uniqueness: true, length: {minimum: 10, message: 'field must contain at least 10 characters'}
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}

	monetize :price_cents

	private

	def ensure_not_referenced_by_any_line_item
		unless line_items.empty?
			errors.add(:base, 'Line Items present')
			throw :abort
		end
	end
end
