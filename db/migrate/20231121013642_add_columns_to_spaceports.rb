class AddColumnsToSpaceports < ActiveRecord::Migration[6.0]
  def change
    add_column :spaceports, :population, :integer, null: false, default: 0
    add_column :spaceports, :year_founded, :integer, null: false, default: 2000
    add_column :spaceports, :description, :text, null: false, default: "Description"
    add_column :spaceports, :img_url, :string, null: false, default: "image.png"
  end
end
