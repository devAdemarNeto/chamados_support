json.extract! ticket, :id, :titulo, :descricao, :status, :user_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
