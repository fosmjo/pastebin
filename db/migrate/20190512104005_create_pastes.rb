class CreatePastes < ActiveRecord::Migration[5.2]
  def change
    create_table :pastes, id: false do |t|
      t.string :shortlink, null: false, limit: 7
      t.datetime :expired_at
      t.string :path, null: false, limit: 255

      t.timestamps
    end

    execute %Q{ ALTER TABLE "pastes" ADD PRIMARY KEY ("shortlink"); }
    add_index :pastes, :created_at
  end
end