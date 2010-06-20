class CreateMilestones < ActiveRecord::Migration
  def self.up
    create_table :milestones do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.decimal :budget_porcentage

      t.timestamps
    end
  end

  def self.down
    drop_table :milestones
  end
end
