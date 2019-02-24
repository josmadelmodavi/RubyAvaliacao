class AddItemsToVenda < ActiveRecord::Migration[5.2]
 	def change
 		add_reference :item_vendas, :venda, index: true
	end
end
