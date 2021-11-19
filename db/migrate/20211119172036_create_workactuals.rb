class CreateWorkactuals < ActiveRecord::Migration[6.1]
  def change
    create_table :workactuals do |t|
      t.date :date
      t.datetime :check_in
      t.datetime :check_out
      t.integer :overtime
      t.references :shift
      t.references :employee

      t.timestamps
    end
  end
end
