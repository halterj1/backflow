class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :report
  # attr_accessible :title, :body
end
