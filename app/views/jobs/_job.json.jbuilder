json.extract! job, :id, :user_id, :language_from_id, :language_to_id, :subject, :description, :price, :paid_at, :stripe_charge_id, :completed_at, :created_at, :updated_at
json.url job_url(job, format: :json)
