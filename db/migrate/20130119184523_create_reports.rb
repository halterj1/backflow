class CreateReports < ActiveRecord::Migration
  def change
    create_table(:reports) do |t|
      t.string    :customer_name
      t.integer   :meter_number
      t.integer   :account_number
      t.string    :service_address
      t.string    :installation_type
      t.datetime  :date_test, :null => false
      t.integer   :assembly_height
      t.text      :assembly_manufacturer
      t.text      :assembly_model
      t.string    :assembly_size
      t.string    :assembly_number
      t.integer   :supply_pressure
      t.integer   :discharge_pressure
      t.string    :assembly_type
      t.text      :remarks
      
      t.timestamps
    end

    add_index :reports, :account_number,                :unique => true
  end
end
