#!/bin/bash

# DigitalOcean Worker Public IP
PUBLIC_IP="134.209.146.20"

# Path to the backend .env file
FILE="../backend/.env.docker"

# Update FRONTEND_URL
if [ -f "$FILE" ]; then
    sed -i "s|^FRONTEND_URL=.*|FRONTEND_URL=\"http://${PUBLIC_IP}:5173\"|g" "$FILE"
    echo "FRONTEND_URL updated to http://${PUBLIC_IP}:5173"
else
    echo "ERROR: $FILE not found."
fi
