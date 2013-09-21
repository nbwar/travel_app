class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :suggestion
      t.integer :choice

      t.timestamps
    end
  end
end
