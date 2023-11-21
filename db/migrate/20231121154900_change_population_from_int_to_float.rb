class ChangePopulationFromIntToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :spaceports, :population, :float
  end
end
