#!/bin/bash

# DigitalOcean Worker Public IP
PUBLIC_IP="134.209.146.20"

# Path to the backend .env file
FILE="../backend/.env.docker"

if [ ! -f "$FILE" ]; then
    echo "ERROR: $FILE not found."
    exit 1
fi

CURRENT_URL=$(grep "^FRONTEND_URL=" "$FILE")

NEW_URL="FRONTEND_URL=\"http://${PUBLIC_IP}:5173\""

if [ "$CURRENT_URL" != "$NEW_URL" ]; then
    sed -i "s|^FRONTEND_URL=.*|$NEW_URL|g" "$FILE"
    echo "Updated FRONTEND_URL to http://${PUBLIC_IP}:5173"
else
    echo "FRONTEND_URL already up-to-date."
fi
