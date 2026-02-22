#!/bin/bash

echo "🚀 Setting up Shopee Master Bot..."

# Install Docker
if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."
    curl -fsSL https://get.docker.com | sh
fi

# Install Docker Compose
if ! command -v docker-compose &> /dev/null; then
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Create directories
mkdir -p logs data models backups

# Build and start
docker-compose build
docker-compose up -d

echo "✅ Setup complete!"
echo "📊 Dashboard: http://localhost:8080"
