class AddCityToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :city, :boolean
  end
end
