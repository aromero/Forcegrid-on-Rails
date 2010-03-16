class CreateBids < ActiveRecord::Migration
  def self.up
    create_table :bids do |t|
      t.decimal :price
      t.string :pricing_method
      t.text :comments
      t.integer :job_id
      t.integer :worker_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bids
  end
end
