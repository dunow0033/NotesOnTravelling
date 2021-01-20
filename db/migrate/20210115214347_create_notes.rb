class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :content, default: ' '
      t.integer :user_id
      t.integer :destination_id

      t.timestamps
    end
  end
end
