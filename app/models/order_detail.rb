class OrderDetail < ApplicationRecord
	before_save {self.total_price=product.price*self.count}	

	belongs_to :product # must be singular
	belongs_to :order, optional: true
	
	validates :count, numericality: {greater_than: 0}
end
