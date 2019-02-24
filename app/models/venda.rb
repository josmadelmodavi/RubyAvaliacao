class Venda < ApplicationRecord
	validates :consumerName, presence: true
	has_many :items

	def has_nil_fields
		self.consumerName.nil?
	end
end
