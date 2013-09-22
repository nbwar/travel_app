class TravelGroupsUsers < ActiveRecord::Migration
  def change
    create_table :travel_groups_users do |t|
      t.belongs_to :user
      t.belongs_to :travel_group
      t.timestamps
    end
  end
end
