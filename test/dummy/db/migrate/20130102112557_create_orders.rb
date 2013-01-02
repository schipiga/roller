class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :title
      t.integer :status_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
