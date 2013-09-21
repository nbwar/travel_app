class Suggestion < ActiveRecord::Base
  belongs_to :travel_group
  belongs_to :excursion
  has_many :votes
end
