class AddCoordinatesToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :start_latitude, :float
    add_column :challenges, :start_longitude, :float
    add_column :challenges, :end_latitude, :float
    add_column :challenges, :end_longitude, :float
  end
end
