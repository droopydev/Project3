class AddUserToCentres < ActiveRecord::Migration[5.2]
  def change
    add_reference :centres, :user, foreign_key: true
  end
end
