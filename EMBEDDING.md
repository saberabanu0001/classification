# How a Computer Understands a Face (Face Embeddings Explained)

This document explains, in simple terms, **how a computer understands a human face** and why **face embeddings** are used in face recognition systems.

No programming or math knowledge is required.

---

## 🧍 Step 1: How Does a Computer “See” a Face?

A computer does **not** see a face the way humans do.

It does **not** understand:
- eyes
- nose
- smile
- beauty
- emotions

Instead, a computer only understands **numbers**.

An image, to a computer, is just a large grid of numbers representing pixel values.

So the first big question is:

> **How can we convert a face image into numbers that represent *who the person is*?**

---

## 🧠 Step 2: What Is a Face Embedding? (Most Important Concept)

Think of a **face embedding** like a **fingerprint**.

Every person:
- has a unique fingerprint
- looks similar to themselves across time
- looks different from others

A **face embedding** is exactly that:

> 👉 a **numeric fingerprint of a face**

It is a list of numbers that uniquely represents a person’s identity.

---

## 🔢 Why 128 Numbers (128-Dimensional Vector)?

Instead of describing a face using words, the model describes it using **128 numerical features**.

You can imagine these features as answers to many tiny questions, such as:

- How wide is the face?
- How far apart are the eyes?
- How sharp is the jawline?
- How deep are the eye sockets?
- What is the nose structure?
- What is the forehead ratio?
- How symmetrical is the face?
- What are the cheekbone patterns?
- What are the skin texture patterns?
- … and many more details that humans cannot consciously describe

Each question produces **one number**.

So a face becomes something like:

