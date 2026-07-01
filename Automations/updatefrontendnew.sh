#!/bin/bash

# DigitalOcean Worker Public IP
PUBLIC_IP="134.209.146.20"

# Path to the frontend .env file
FILE="../frontend/.env.docker"

if [ ! -f "$FILE" ]; then
    echo "ERROR: $FILE not found."
    exit 1
fi

CURRENT_URL=$(grep "^VITE_API_PATH=" "$FILE")

NEW_URL="VITE_API_PATH=\"http://${PUBLIC_IP}:31100\""

if [ "$CURRENT_URL" != "$NEW_URL" ]; then
    sed -i "s|^VITE_API_PATH=.*|$NEW_URL|g" "$FILE"
    echo "Updated VITE_API_PATH to http://${PUBLIC_IP}:31100"
else
    echo "VITE_API_PATH already up-to-date."
fi
