class AddEmployerIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :employer_id, :integer
  end

  def self.down
    remove_column :users, :employer_id
  end
end
