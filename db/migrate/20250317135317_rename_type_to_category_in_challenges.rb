class RenameTypeToCategoryInChallenges < ActiveRecord::Migration[7.1]
  def change
    rename_column :challenges, :type, :category
  end
end
