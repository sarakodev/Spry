class AddUserIdToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_reference :challenges, :user, null: false, foreign_key: true
  end
end
