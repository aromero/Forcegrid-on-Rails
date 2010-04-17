class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :skills
  end
  
  create_table :skill_workers, :id => false do |t|
    t.references :skill, :worker
    t.timestamps
  end
end
