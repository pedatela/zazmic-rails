class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions, id: :uuid do |t|
      t.datetime :start
      t.integer :duration
      t.references :client, null: false, foreign_key: { to_table: :clients }, type: :uuid
      t.references :coach, null: false, foreign_key: { to_table: :clients }, type: :uuid
      t.timestamps
    end
  end
end
