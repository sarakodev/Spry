class ChangeTypeOfCompletionFromChallenges < ActiveRecord::Migration[7.1]
  def change
    change_column :challenges, :completion, :float
  end
end
