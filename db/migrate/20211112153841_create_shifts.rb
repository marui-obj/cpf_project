class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.references 'department'

      t.timestamps
    end
  end
end
