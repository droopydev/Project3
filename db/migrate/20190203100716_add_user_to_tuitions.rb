class AddUserToTuitions < ActiveRecord::Migration[5.2]
  def change
    add_reference :tuitions, :user, foreign_key: true
  end
end
