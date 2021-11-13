class CreateJoinTableEmployeeShift < ActiveRecord::Migration[6.1]
  def change
    create_join_table :employees, :shifts do |t|
      t.index [:employee_id, :shift_id]
      t.index [:shift_id, :employee_id]
    end
  end
end
