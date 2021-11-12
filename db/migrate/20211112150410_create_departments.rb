class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string 'title'
      t.datetime 'check_in'
      t.datetime 'check_out'
      t.datetime 'overtime'
      # t.references 'manager'
      # t.references 'employee'

      t.timestamps
    end
  end
end
