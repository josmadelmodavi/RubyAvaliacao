class ItemVenda < ApplicationRecord
	validates :name, presence: true
	validates :valor, presence: true
	validates :quantity, presence: true

	def has_nil_fields
		self.name.nil? || self.valor.nil? || self.quantity.nil?
	end
end
