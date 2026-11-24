class AddCountryToCocktails < ActiveRecord::Migration[6.1]
  def change
    add_column :cocktails, :country, :string
  end
end
