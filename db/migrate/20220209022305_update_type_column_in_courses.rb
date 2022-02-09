class UpdateTypeColumnInCourses < ActiveRecord::Migration[6.1]
  def change
    rename_column(:courses, :type, :courses_type)
  end
end
