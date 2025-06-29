#!/bin/sh

SECRET_FILE="/app/data/session_secret"

# Nur generieren, wenn noch nicht vorhanden
if [ ! -f "$SECRET_FILE" ]; then
  echo "Generating new PUBLIC_SESSION_SECRET..."
  mkdir -p "$(dirname "$SECRET_FILE")"
  head -c 32 /dev/urandom | base64 > "$SECRET_FILE"
  echo "Secret written to $SECRET_FILE"
else
  echo "Secret already exists. Skipping generation."
fi
