class AddUserIdToPastes < ActiveRecord::Migration[5.2]
  def change
    add_column :pastes, :user_id, :bigint
    add_index :pastes, :user_id
  end
end
