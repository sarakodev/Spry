class RenameNameToTitleInChallenges < ActiveRecord::Migration[7.1]
  def change
    rename_column :challenges, :name, :title
  end
end
