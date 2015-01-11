class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :house_id, :integer

    add_column :users, :solar,        :decimal, :precision => 12, :scale => 4, :default => 0.0
    add_column :users, :melange,      :decimal, :precision => 12, :scale => 4, :default => 0.0
    add_column :users, :exp,          :decimal, :precision => 12, :scale => 4, :default => 0.0
    add_column :users, :admin,        :boolean, :default => false
    add_column :users, :leader,       :boolean, :default => false
    add_column :users, :emperor,      :boolean, :default => false
    add_column :users, :arrakis,      :boolean, :default => false
    add_column :users, :regent,       :boolean, :default => false
    add_column :users, :vezir,        :boolean, :default => false
    add_column :users, :court,        :boolean, :default => false
    add_column :users, :mentat,       :boolean, :default => false
    add_column :users, :army_mentat,  :boolean, :default => false
    add_column :users, :diplomat,     :boolean, :default => false
    add_column :users, :senator,      :boolean, :default => false
    add_column :users, :chairman,     :boolean, :default => false

    add_index :users, :username
    add_index :users, :house_id
  end
end
