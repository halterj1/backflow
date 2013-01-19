namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [User, Report].each(&:delete_all)
    
    User.populate 5 do |user|
      user.name                = Faker::Name.name
      user.email               = Faker::Internet.email
      user.encrypted_password  = Faker::Name.name
    end
    
    Report.populate 5 do |report|
      report.customer_name   = Populator.words(1..3).titleize
      report.date_test       = "02/12/1992"
    end
    
  end
end