class CreateExpenseTypes < ActiveRecord::Migration
  def change
    create_table :expense_types do |t|

      t.timestamps
    end
  end
end
