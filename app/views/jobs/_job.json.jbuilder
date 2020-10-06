json.extract! job, :id, :title, :description, :url, :job_type, :location, :remote_ok, :link_to_apply, :status, :price, :published_at, :featured_until, :created_at, :updated_at
json.url job_url(job, format: :json)
