class Location < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'refLocations'
  belongs_to :employee, foreign_key: 'responsible'
end
