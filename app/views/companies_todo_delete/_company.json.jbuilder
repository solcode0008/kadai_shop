json.extract! company, :id, :name, :phone_number, :mail, :created_at, :updated_at
json.url company_url(company, format: :json)
