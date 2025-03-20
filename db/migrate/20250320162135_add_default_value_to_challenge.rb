class AddDefaultValueToChallenge < ActiveRecord::Migration[7.1]
  def change
    change_column_default :challenges, :duration, from: nil, to: 0.0
    change_column_default :challenges, :distance, from: nil, to: 0.0
  end
end
