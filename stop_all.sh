#!/bin/bash

# Base directory - current directory where the script is run
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
  echo "Stopping $service..."

  if [ -d "$SERVICE_PATH" ]; then
    ( cd "$SERVICE_PATH" && docker compose stop )
  else
    echo "Warning: Directory $SERVICE_PATH does not exist!"
  fi
done

echo "All services stopped."
