class AddColumnsToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :content, :string
    add_column :notes, :user_id, :integer
  end
end
