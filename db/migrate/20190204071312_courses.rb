class Courses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.text :description
      t.integer :age
      t.text :category
      t.integer :credits
      
      t.timestamps
    end
  end
end
