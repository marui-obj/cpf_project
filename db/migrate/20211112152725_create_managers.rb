class CreateManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :managers do |t|
      t.string :name
      t.string :uid

      t.timestamps
    end
  end
end
