class CreateEsp8266s < ActiveRecord::Migration[7.0]
  def change
    create_table :esp8266s do |t|
      t.string :device
      t.string :status

      t.timestamps
    end
  end
end
