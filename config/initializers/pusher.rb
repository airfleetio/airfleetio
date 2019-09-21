require 'pusher'

def credentials(key)
  Rails.application.credentials.dig :pusher, key
end

Pusher.app_id = credentials :app_id
Pusher.key = credentials :key
Pusher.secret = credentials :secret
Pusher.cluster = credentials :cluster
