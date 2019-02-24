class CreateVendas < ActiveRecord::Migration[5.2]
  def change
    create_table :vendas do |t|
      t.string :consumerName

      t.timestamps
    end
  end
end
