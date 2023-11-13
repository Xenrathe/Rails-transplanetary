class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.time :duration, null: false
      t.datetime :takeoff, null: false
      t.references :departure_spaceport, foreign_key: { to_table: :spaceports }
      t.references :arrival_spaceport, foreign_key: { to_table: :spaceports }
      t.timestamps
    end
  end
end
