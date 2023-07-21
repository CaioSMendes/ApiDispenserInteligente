class CreateEsp8266s < ActiveRecord::Migration[7.0]
  def change
    create_table :esp8266s do |t|
      t.string :device
      t.string :status
      t.string :ipadrrs
      t.integer :cont
      t.string :last_seen
      t.string :padlock
      t.string :owner
      t.string :phone
      t.integer :fullmax


      t.timestamps
    end
  end
end