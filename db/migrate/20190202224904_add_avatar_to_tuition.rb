class AddAvatarToTuition < ActiveRecord::Migration[5.2]
  def change
    add_column :tuitions, :avatar, :string
  end
end
