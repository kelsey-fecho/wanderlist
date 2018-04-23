class FixDestinationDescriptionTypo < ActiveRecord::Migration
  def change
    rename_column :destinations, :desciption, :description
  end
end
