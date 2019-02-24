class CreateItemVendas < ActiveRecord::Migration[5.2]
  def change
    create_table :item_vendas do |t|
      t.string :name
      t.float :valor
      t.integer :quantity

      t.timestamps
    end
  end
end
