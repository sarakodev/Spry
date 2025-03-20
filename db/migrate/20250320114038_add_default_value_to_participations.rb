class AddDefaultValueToParticipations < ActiveRecord::Migration[7.1]
  def change
    change_column_default :participations, :duration, from: nil, to: 0.0
    change_column_default :participations, :distance, from: nil, to: 0.0
  end
end
