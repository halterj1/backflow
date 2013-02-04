class Company < ActiveRecord::Base
  # attr_accessible :title, :body
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :report_ids, :as => :admin
  attr_accessible :company_number, :company_name, :company_email, :company_county
end
