class CreateExcursions < ActiveRecord::Migration
  def change
    create_table :excursions do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :price
      t.string :image_url
      t.string :link
      t.date :date

      t.timestamps
    end
  end
end
