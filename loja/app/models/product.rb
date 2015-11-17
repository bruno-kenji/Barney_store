class Product < ActiveRecord::Base
    has_and_belongs_to_many :categories
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png|jpeg)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
}
	def self.latest
		Product.order(:updated_at).last
	end

	def self.order_by_name
		Product.order(:name)
	end
end