module ApiV0
  class Courses < Grape::API
    before { authenticate! }

    # action:index, path: /api/v0/courses?access_key=your_key
    desc "Get all courses"
    get "/courses" do
      courses = current_user.courses
      present courses, with: ApiV0::Entities::Course
    end

    # action: show, path: /api/v0/courses/:id?access_key=your_key
    desc "Get your course"
    params do
      requires :id, type: String, desc: 'Course ID'
    end

    get "/courses/:id" do
      course = current_user.courses.find_by(id: params[:id])
      present course, with: ApiV0::Entities::Course
    end

  end
end