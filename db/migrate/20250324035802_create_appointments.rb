class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :client, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.datetime :data_hora
      t.string :status

      t.timestamps
    end
  end
end
