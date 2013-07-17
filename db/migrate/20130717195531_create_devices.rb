class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :friendly_name
      t.string :udid
      t.boolean :keep

      t.timestamps
    end
  end
end
