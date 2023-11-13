class CreateSpaceports < ActiveRecord::Migration[7.0]
  def change
    create_table :spaceports do |t|
      t.string :code, limit: 3, null: false
      t.string :full_name, null: false
      t.timestamps
    end
  end
end
