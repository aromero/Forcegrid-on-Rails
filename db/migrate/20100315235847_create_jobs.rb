class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.date :start_time
      t.date :end_time
      t.date :project_begin
      t.date :project_finish
      t.string :location
      t.decimal :budget
      t.string :pricing_method
      t.string :service_contact
      t.string :buyers_support_contact
      t.string :state
      t.integer :employer_id
      t.integer :category_id
      t.integer :visitor_count

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
