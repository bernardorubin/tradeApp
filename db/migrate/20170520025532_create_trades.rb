class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.string :currency
      t.integer :initial_price

      t.timestamps
    end
  end
end
