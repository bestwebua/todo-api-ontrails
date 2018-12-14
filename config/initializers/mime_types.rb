api_mime_types = %w(application/vnd.api+json)

Mime::Type.register 'application/vnd.api+json', :json, api_mime_types
