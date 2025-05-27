# Redmine API with Swagger UI and CORS Support

This project sets up a Redmine instance with Swagger UI documentation and CORS support for cross-origin API requests.

## 🚀 Quick Start

1. **Start the services:**

   ```bash
   docker-compose up -d
   ```

2. **Access the services:**
   - **Redmine**: http://localhost:3001
   - **Swagger UI**: http://localhost:8080
   - **CORS Test Page**: Open `test-cors.html` in your browser

## 📋 Services

### Redmine (Port 3001)

- Full Redmine project management system
- REST API with CORS support enabled
- PostgreSQL database backend

### Swagger UI (Port 8080)

- Interactive API documentation
- Test API endpoints directly from the browser
- Supports authentication with API keys

### PostgreSQL Database

- Persistent data storage for Redmine
- Health checks enabled

## 🔧 CORS Configuration

The CORS issue has been resolved by adding a custom middleware to Redmine that:

- Allows requests from any origin (`*`)
- Supports all common HTTP methods (GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD)
- Includes necessary headers for API authentication
- Handles preflight OPTIONS requests

### CORS Headers Added:

- `Access-Control-Allow-Origin: *`
- `Access-Control-Allow-Methods: GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD`
- `Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, Token, X-Redmine-API-Key`
- `Access-Control-Max-Age: 1728000`

## 🔑 API Authentication

The Redmine API supports two authentication methods:

### 1. API Key Authentication

Add the header: `X-Redmine-API-Key: your-api-key-here`

### 2. Basic Authentication

Use standard HTTP Basic Auth with username and password.

## 🧪 Testing CORS

### Method 1: Using the Test Page

1. Open `test-cors.html` in your browser
2. Click "Test CORS with Redmine API"
3. Optionally test with an API key

### Method 2: Using curl

```bash
# Test basic API access
curl -I http://localhost:3001/issues.json

# Test with API key
curl -H "X-Redmine-API-Key: your-key" http://localhost:3001/issues.json

# Test OPTIONS preflight request
curl -X OPTIONS -I http://localhost:3001/issues.json
```

### Method 3: Using Swagger UI

1. Go to http://localhost:8080
2. Try any API endpoint
3. Add authentication if needed

## 📁 Project Structure

```
.
├── docker-compose.yml          # Docker services configuration
├── swagger.yaml               # OpenAPI/Swagger specification
├── config/
│   └── cors.rb               # CORS middleware configuration
├── test-cors.html            # CORS testing page
└── README.md                 # This file
```

## 🔍 Troubleshooting

### CORS Errors

If you still see CORS errors:

1. **Check if containers are running:**

   ```bash
   docker-compose ps
   ```

2. **Restart the services:**

   ```bash
   docker-compose restart
   ```

3. **Check Redmine logs:**

   ```bash
   docker-compose logs redmine
   ```

4. **Verify CORS headers:**
   ```bash
   curl -I http://localhost:3001/issues.json
   ```

### Common Issues

1. **"Failed to fetch" errors**: Usually indicates CORS is not properly configured
2. **401 Unauthorized**: API key required for certain endpoints
3. **404 Not Found**: Check the API endpoint URL in swagger.yaml

## 🛠️ Development

### Modifying the API Specification

Edit `swagger.yaml` and restart the swagger-ui service:

```bash
docker-compose restart swagger-ui
```

### Updating CORS Configuration

Edit `config/cors.rb` and restart the redmine service:

```bash
docker-compose restart redmine
```

### Adding New Endpoints

1. Update `swagger.yaml` with new endpoint definitions
2. Ensure the Redmine instance supports the endpoints
3. Test with Swagger UI

## 📚 API Documentation

- **Redmine REST API**: http://www.redmine.org/projects/redmine/wiki/Rest_api
- **OpenAPI Specification**: https://swagger.io/specification/
- **Swagger UI**: https://swagger.io/tools/swagger-ui/

## 🔒 Security Notes

- The current CORS configuration allows requests from any origin (`*`)
- For production use, consider restricting origins to specific domains
- Always use HTTPS in production environments
- Keep API keys secure and rotate them regularly

## 📝 License

This project is for demonstration purposes. Redmine is licensed under the GNU General Public License v2.
