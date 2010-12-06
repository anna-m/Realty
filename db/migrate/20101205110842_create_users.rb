class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :status, :default => 'user'
      t.string :card
      t.integer :counter, :default => 50

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
