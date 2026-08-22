#!/bin/bash
# Start the frontend dev server
set -e
echo "Starting frontend dev server..."
cd frontend
npm install
npm run dev
