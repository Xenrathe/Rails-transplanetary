class ChangeDurationToFloatInFlights < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :duration
    add_column :flights, :duration, :float, null: false
  end
end
