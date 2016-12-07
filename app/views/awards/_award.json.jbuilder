json.extract! award, :id, :title, :description, :points_required, :created_at, :updated_at
json.url award_url(award, format: :json)