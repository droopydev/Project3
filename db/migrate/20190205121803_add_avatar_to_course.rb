class AddAvatarToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :avatar, :text
  end
end
