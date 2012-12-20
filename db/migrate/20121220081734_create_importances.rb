class CreateImportances < ActiveRecord::Migration
  def change
    create_table :importances do |t|

      t.timestamps
    end
  end
end
