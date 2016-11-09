class Product < ApplicationRecord
	validates :name,:price, presence:true
	validates :name, length:{minimum:2,maximum:100}
	validates_numericality_of :price, greater_than:100

	has_many :order_details # must be plural form
	has_many :orders, through: :order_details

	def sales_count
		return order_details.sum(:count)
	end
	def self.sales_ranking(count=10)
		self.joins(:order_details).group('order_details.product_id').order('SUM(order_details.count) DESC').first(count)
	end
	def format_content
		"#{name} #{price}"
	end
end
