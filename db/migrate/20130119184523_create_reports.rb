class CreateReports < ActiveRecord::Migration
  def change
    create_table(:reports) do |t|
      t.string    :customer_name, :null => false
      t.string    :customer_number, :null => false, :unique => true
      t.string    :account_number, :null => false, :unique => true
      t.string    :meter_number
      t.string    :service_address, :null => false
      t.string    :installation_type, :null => false
      t.date      :date_test, :null => false
      t.string    :assembly_height
      t.string    :assembly_manufacturer
      t.string    :assembly_model
      t.decimal   :assembly_size
      t.string    :assembly_number
      t.integer   :supply_pressure
      t.integer   :discharge_pressure
      t.string    :assembly_type, :null => false
      t.text      :remarks
      
      t.timestamps
    end

    add_index :reports, :account_number,                :unique => true
  end
end
