class AddGroupCodeToTravelGroup < ActiveRecord::Migration
  def change
    add_column :travel_groups, :group_code, :string
  end
end
