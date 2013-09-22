class CreateExcursions < ActiveRecord::Migration
  def change
    create_table :excursions do |t|
      t.string :name
      t.string :description
      t.string :price
      t.string :image_url
      t.string :link
      t.string :city
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
      t.date :date

      t.timestamps
    end
  end
end
