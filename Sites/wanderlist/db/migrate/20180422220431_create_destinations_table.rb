class CreateDestinationsTable < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :desciption
    end
  end
end
