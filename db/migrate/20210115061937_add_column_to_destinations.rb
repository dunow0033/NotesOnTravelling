class AddColumnToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :destination_name, :string
  end
end
