namespace :db do
  desc "Erase and fill database with reports"
  task :populate => :environment do
    require 'populator'
    require 'ffaker'
    
    [Report, User].each(&:delete_all)
    
    User.populate 9 do |user|
      user.name                = Faker::Name.name
      user.email               = Faker::Internet.email
      user.encrypted_password  = Faker::Name.name
    end
    
    puts 'DEFAULT USERS'
    user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
    puts 'user: ' << user.name
    user.add_role :admin
    
    Report.populate 50 do |report|
      report.customer_name          = Faker::Name.name
      report.customer_number        = Faker::PhoneNumber.short_phone_number
      report.account_number         = rand(1000000...9999999)
      report.meter_number           = rand(100000...999999)
      report.service_address        = Faker::Address.street_address(include_secondary = false)
      report.installation_type      = ['Containment', 'Isolation']
      report.date_test              = rand(2...10).years.ago..DateTime.now
      report.assembly_height        = rand(10...40)
      report.assembly_manufacturer  = Faker::Company.name
      report.assembly_model         = Faker::Product.model
      report.assembly_size          = rand(1..2)
      report.assembly_number        = rand(10000...99999)
      report.supply_pressure        = rand(50...100)
      report.discharge_pressure     = rand(50...100)
      report.assembly_type          = ['RPZA', 'DCVA', 'Fire Check', 'PVB', 'AVB', 'Air Gap']
      report.remarks                = Populator.sentences(2..3)
    end
    
  end
end

#Category.populate 20 do |category|
#  category.name = Populator.words(1..3).titleize
#  Product.populate 10..100 do |product|
#    product.category_id = category.id
#    product.name = Populator.words(1..5).titleize
#    product.description = Populator.sentences(2..10)
#    product.price = [4.99, 19.95, 100]
#    product.created_at = 2.years.ago..Time.now
#  end
#end

#Person.populate 100 do |person|
#  person.name    = Faker::Name.name
#  person.company = Faker::Company.name
#  person.email   = Faker::Internet.email
#  person.phone   = Faker::PhoneNumber.phone_number
#  person.street  = Faker::Address.street_address
#  person.city    = Faker::Address.city
#  person.state   = Faker::Address.us_state_abbr
#  person.zip     = Faker::Address.zip_code
#end