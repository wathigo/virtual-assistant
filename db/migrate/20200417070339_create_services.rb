class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.text :name
      t.string :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
