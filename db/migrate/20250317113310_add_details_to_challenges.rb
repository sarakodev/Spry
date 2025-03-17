class AddDetailsToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :start_point, :string
    add_column :challenges, :end_point, :string
    add_column :challenges, :team_name, :string
  end
end
