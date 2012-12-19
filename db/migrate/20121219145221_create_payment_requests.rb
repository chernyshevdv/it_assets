class CreatePaymentRequests < ActiveRecord::Migration
  def change
    create_table :payment_requests do |t|

      t.timestamps
    end
  end
end
