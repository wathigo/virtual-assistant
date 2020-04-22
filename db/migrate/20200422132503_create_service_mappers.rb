class CreateServiceMappers < ActiveRecord::Migration[6.0]
  def change
    create_table :service_mappers do |t|
      t.references :service, foreign_key: true
      t.integer :client_id, null: false
      t.integer :employee_id, null: false

      t.timestamps
    end
  end
end
