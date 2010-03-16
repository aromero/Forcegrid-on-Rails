class CreateWorkers < ActiveRecord::Migration
  def self.up
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :country
      t.string :business_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :company_phone
      t.string :website_url
      t.string :number_employees
      t.integer :year_comp_founded
      t.string :stock_parts
      t.string :company_logo
      t.text :company_background
      t.text :detailed_service_desc

      t.timestamps
    end
  end

  def self.down
    drop_table :workers
  end
end
