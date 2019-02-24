class AddItemVendaToVenda < ActiveRecord::Migration[5.2]
 	def change
 		add_reference :items, :venda, index: true
 	end
end
