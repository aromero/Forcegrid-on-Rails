class AddWorkerIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :worker_id, :integer
  end

  def self.down
    remove_column :users, :worker_id
  end
end
