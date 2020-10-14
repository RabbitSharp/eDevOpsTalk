# Get Images and start
docker-compose up -d
# Build Images and start
docker-compose up --build -d
# Test App
Start-Process http://localhost:8080
# Clean up resources
docker-compose down