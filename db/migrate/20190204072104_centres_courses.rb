class CentresCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :centres_courses do |t|
      t.references :centres
      t.references :courses
      t.timestamps
    end
  end
end
