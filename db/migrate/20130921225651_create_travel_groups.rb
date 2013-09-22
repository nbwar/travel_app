class CreateTravelGroups < ActiveRecord::Migration
  def change
    create_table :travel_groups do |t|
      t.string :name
      t.string :destination
      t.string :city
      t.string :state
      t.float :lat
      t.float :long
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
