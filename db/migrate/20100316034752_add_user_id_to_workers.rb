class AddUserIdToWorkers < ActiveRecord::Migration
  def self.up
    add_column :workers, :user_id, :integer
  end

  def self.down
    remove_column :workers, :user_id
  end
end
