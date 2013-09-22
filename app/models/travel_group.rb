class TravelGroup < ActiveRecord::Base
  #TODO: Either create a groupe token or invitation to group
  has_and_belongs_to_many :users
  has_many :suggestions
  has_many :excursions, through: :suggestions

end
