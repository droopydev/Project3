class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :centre_name
      t.string :description
      t.integer :suitable_age
      t.integer :credits

      t.timestamps
    end
  end
end
