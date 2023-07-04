class CreateRfidCards < ActiveRecord::Migration[7.0]
  def change
    create_table :rfid_cards do |t|
      t.string :uid
      t.string :description

      t.timestamps
    end
  end
end
