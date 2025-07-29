#!/bin/bash

# Base directory - current directory (where this script runs)
BASE_DIR="$(pwd)"

# List of service directories
services=(
  "jellyfin"
  "navidrome"
  "nginx-proxy-manager"
  "plex"
)

for service in "${services[@]}"; do
  SERVICE_PATH="$BASE_DIR/$service"
  echo "Starting $service..."

  if [ -d "$SERVICE_PATH" ]; then
    ( cd "$SERVICE_PATH" && docker compose up -d )
  else
    echo "Warning: Directory $SERVICE_PATH does not exist!"
  fi
done

echo "All services started."
