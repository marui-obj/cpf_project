class CreateManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :managers do |t|
      t.string :name
      t.string :uid
      t.references :user

      t.timestamps
    end
  end
end
