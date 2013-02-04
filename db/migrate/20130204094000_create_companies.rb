class CreateCompanies < ActiveRecord::Migration
  def change
    create_table(:companies) do |t|
      t.string    :company_name, :null => false, :unique => true
      t.string    :company_number
      t.string    :company_email
      t.string    :company_county
      
      t.timestamps
    end

  end
end
