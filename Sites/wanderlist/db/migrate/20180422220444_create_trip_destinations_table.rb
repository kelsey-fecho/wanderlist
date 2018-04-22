class CreateTripDestinationsTable < ActiveRecord::Migration
  def change
    create_table :trip_destinations do |t|
      t.integer :trip_id
      t.integer :destination_id
    end
  end
end
