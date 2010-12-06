class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.string :kind
      t.text :description
      t.integer :rooms
      t.integer :square
      t.integer :price
      t.string :metro
      t.string :parking

      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
