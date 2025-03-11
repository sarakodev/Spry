class AddKilometersToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :kilometers, :float
  end
end
