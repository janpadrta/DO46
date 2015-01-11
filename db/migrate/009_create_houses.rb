class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :type
      t.decimal :solar
      t.decimal :exp
      t.decimal :melange
      t.decimal :material
      t.decimal :population

      t.timestamps
    end
  end
end
