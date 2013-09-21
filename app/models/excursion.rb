class Excursion < ActiveRecord::Base
  has_many :suggestions
  has_many :travel_groups, through: :suggestions
end
