class AddImageToTravelGroups < ActiveRecord::Migration
  def change
    add_column :travel_groups, :image, :string
  end
end
