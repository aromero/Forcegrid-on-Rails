class CreateEmployers < ActiveRecord::Migration
  def self.up
    create_table :employers do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.integer :user_id
      t.string :phone
      t.string :pay_method

      t.timestamps
    end
  end

  def self.down
    drop_table :employers
  end
end
