class CreateTripsTable < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :description
      t.string :status
      t.integer :user_id
    end
  end
end
