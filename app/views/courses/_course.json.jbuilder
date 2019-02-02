json.extract! course, :id, :name, :description, :suitable_age, : credits, :created_at, :updated_at
json.url course_url(course, format: :json)
