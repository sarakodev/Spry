class RemovePhotoFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :photo, :string
  end
end
