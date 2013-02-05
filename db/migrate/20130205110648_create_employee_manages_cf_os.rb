class CreateEmployeeManagesCfOs < ActiveRecord::Migration
  def change
    create_table :employee_manages_cf_os do |t|

      t.timestamps
    end
  end
end
