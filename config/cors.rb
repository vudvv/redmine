# CORS configuration for Redmine API
# This file adds CORS headers to allow cross-origin requests from Swagger UI

class CorsMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    
    # Add CORS headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, X-Redmine-API-Key'
    headers['Access-Control-Max-Age'] = '1728000'
    
    # Handle preflight requests
    if env['REQUEST_METHOD'] == 'OPTIONS'
      return [200, headers, ['']]
    end
    
    [status, headers, body]
  end
end

Rails.application.config.middleware.insert_before 0, CorsMiddleware 