#!/bin/bash

# Simple script to start the backend server

echo "🚀 Starting Face Recognition Backend Server..."
echo ""

# Navigate to project root
cd "$(dirname "$0")"

# Check if port 8000 is already in use
if lsof -Pi :8000 -sTCP:LISTEN -t >/dev/null 2>&1 ; then
    echo "⚠️  Port 8000 is already in use!"
    echo "🔄 Freeing up port 8000..."
    lsof -ti :8000 | xargs kill -9 2>/dev/null
    sleep 2
    echo "✅ Port 8000 is now free!"
    echo ""
fi

# Activate virtual environment
echo "📦 Activating Python environment..."
source face/bin/activate

# Check if FastAPI is installed
if ! python -c "import fastapi" 2>/dev/null; then
    echo "❌ FastAPI not found. Installing..."
    pip install fastapi uvicorn python-multipart
fi

# Start the server
echo "✅ Starting server on http://0.0.0.0:8000"
echo "📱 Your Flutter app should connect to: http://10.0.2.2:8000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

uvicorn backend.main:app --reload --host 0.0.0.0

