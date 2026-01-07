# Backend API - Simple Explanation

## 🎯 What is a Backend API?

Think of it like a **restaurant**:
- **Your Flutter App** = You (the customer)
- **Backend API** = The kitchen (does the cooking)
- **API Request** = You ordering food
- **API Response** = The food being served

## 📱 How Your App Works

```
┌─────────────────┐
│  Flutter App     │
│  (Your Phone)    │
│                  │
│  [Pick Image 1]  │
│  [Pick Image 2]  │
│  [Compare Faces] │ ← You click this
└────────┬─────────┘
         │
         │ Sends 2 images
         │ via HTTP request
         ▼
┌─────────────────┐
│  Python Backend  │
│  (Your Computer)  │
│                  │
│  Receives images │
│  Compares faces  │ ← Does the work
│  Calculates      │
│  similarity      │
└────────┬─────────┘
         │
         │ Sends result back
         │ (similarity score)
         ▼
┌─────────────────┐
│  Flutter App     │
│                  │
│  Shows result:   │
│  "SAME PERSON"   │
│  or              │
│  "DIFFERENT"     │
└─────────────────┘
```

## 🔧 Why Do We Need This?

**Problem:** 
- Face recognition uses Python libraries (`face_recognition`, `dlib`)
- Flutter apps can't run Python code directly

**Solution:**
- Run Python on your computer (backend server)
- Flutter app sends images to Python
- Python processes and sends result back

## 📍 Where is Everything?

```
Your Project:
├── face_re_app/          ← Flutter app (mobile)
│   └── lib/main.dart    ← Your app code
│
├── backend/              ← Python server
│   ├── main.py          ← API server (receives requests)
│   └── inference.py     ← Face comparison logic
│
└── face/                ← Python environment
```

## 🚀 How to Use It

### Step 1: Start the Backend (Python Server)
```bash
# Go to project root
cd "/Users/saberabanu/All Drives/Personal/classification-face-rec"

# Activate Python environment
source face/bin/activate

# Start the server
uvicorn backend.main:app --reload --host 0.0.0.0
```

**What this does:**
- Starts a server on your computer
- Listens on port 8000
- Waits for requests from your Flutter app

### Step 2: Run Your Flutter App
```bash
cd face_re_app
flutter run
```

**What this does:**
- Starts your mobile app
- App can now send images to the backend

### Step 3: Use the App
1. Pick Image 1
2. Pick Image 2  
3. Click "Compare Faces"
4. App sends images → Backend processes → Shows result

## 🌐 The Connection

**On Android Emulator:**
- Your computer = `10.0.2.2` (special address)
- Backend URL = `http://10.0.2.2:8000`

**On Real Phone:**
- Need to find your computer's IP address
- Backend URL = `http://YOUR_COMPUTER_IP:8000`

## ✅ Quick Checklist

- [ ] Backend server is running (uvicorn command)
- [ ] Flutter app is running
- [ ] Both images are selected
- [ ] Click "Compare Faces"

## 🐛 Troubleshooting

**"Cannot connect to backend"**
→ Make sure the backend server is running!

**"Connection refused"**
→ Check if uvicorn is running on port 8000

**"Timeout"**
→ Backend might be slow processing, or not running

## 💡 Think of it Like This:

- **Backend** = A helper that does the hard work
- **API** = The way your app talks to the helper
- **Request** = Asking the helper to do something
- **Response** = The helper giving you the answer

That's it! The backend is just a helper program running on your computer that does face recognition for your mobile app.

