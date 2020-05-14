class CreateRoomMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :room_messages do |t|
      t.references :room, null: false, foreign_key: true
      t.text :message
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
