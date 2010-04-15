class CreateAssigments < ActiveRecord::Migration
  def self.up
    create_table :assigments do |t|
      t.integer :job_id
      t.integer :worker_id

      t.timestamps
    end
  end

  def self.down
    drop_table :assigments
  end
end
