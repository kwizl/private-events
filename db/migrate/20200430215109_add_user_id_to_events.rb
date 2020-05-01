class AddUserIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :attendee_id, :integer
    add_index :events, :attendee_id
  end
end
