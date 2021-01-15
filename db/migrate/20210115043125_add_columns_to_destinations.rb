class AddColumnsToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :user_id, :integer
    add_column :destinations, :note_id, :integer
  end
end
