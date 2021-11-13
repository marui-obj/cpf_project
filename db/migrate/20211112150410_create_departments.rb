class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :title
      t.references :manager

      t.timestamps
    end
  end
end
