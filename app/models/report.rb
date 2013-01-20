class Report < ActiveRecord::Base
  # attr_accessible :title, :body

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :customer_name, :customer_number, :account_number, :meter_number, :service_address, :installation_type, :date_test, :assembly_height, :assembly_manufacturer, :assembly_model, :assembly_size, :assembly_number, :supply_pressure, :discharge_pressure, :assembly_type, :remarks
  
end
