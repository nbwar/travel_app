class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :suggestion
  validates_uniqueness_of :user_id, :scope => :suggestion_id

end
