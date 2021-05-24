json.extract! friends_attachment, :id, :friend_id, :avatar, :created_at, :updated_at
json.url friends_attachment_url(friends_attachment, format: :json)
