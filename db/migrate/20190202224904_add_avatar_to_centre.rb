class AddAvatarToCentre < ActiveRecord::Migration[5.2]
  def change
    add_column :centres, :avatar, :string
  end
end
