class TravelGroup < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :suggestions
  has_many :excursions, through: :suggestions

end
