class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.date :date
      t.datetime :check_in
      t.datetime :check_out
      t.float :overtime
      t.references :department

      t.timestamps
    end
  end
end
