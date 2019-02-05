class CentresCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :centres_courses do |t|
      t.references :centre
      t.references :course
      t.timestamps
    end
  end
end
