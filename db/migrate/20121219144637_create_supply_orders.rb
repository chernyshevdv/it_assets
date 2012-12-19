class CreateSupplyOrders < ActiveRecord::Migration
  def change
    create_table :supply_orders do |t|

      t.timestamps
    end
  end
end
