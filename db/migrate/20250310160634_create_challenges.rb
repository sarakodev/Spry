class CreateChallenges < ActiveRecord::Migration[7.1]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :type
      t.boolean :completed
      t.integer :completion
      t.float :distance
      t.float :duration

      t.timestamps
    end
  end
end
