class Report < ActiveRecord::Base
  attr_accessible :customer_name, :customer_number, :account_number, :meter_number, :service_address, :installation_type, :date_test, :assembly_height, :assembly_manufacturer, :assembly_model, :assembly_size, :assembly_number, :supply_pressure, :discharge_pressure, :assembly_type, :remarks
  has_many :comments, as: :commentable
  
  attr_accessible :tag_list
  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by_name!(name).reports
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end
  
  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
