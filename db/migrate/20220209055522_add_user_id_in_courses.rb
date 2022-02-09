class AddUserIdInCourses < ActiveRecord::Migration[6.1]
  def change
    add_reference(:courses, :user)
  end
end
