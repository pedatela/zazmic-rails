class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :name
      t.string :email
      t.boolean :coach

      t.timestamps
    end
  end
end
