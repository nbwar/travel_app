class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :vote_count, :default => 0
      t.belongs_to :travel_group
      t.belongs_to :excursion

      t.timestamps
    end
  end
end
