import os
import face_recognition
import numpy as np


class FaceAnalysis:
    def __init__(self):
        """
        Initialize FaceAnalysis with face_recognition library.
        Uses dlib's face recognition model which is accurate and fast.
        """
        print("✅ Using face_recognition library (dlib-based)")
        print("   Model will be loaded on first use.")

    def compare(self, img1_path, img2_path, threshold=0.6):
        """
        Compare two face images and determine if they are the same person.
        
        Args:
            img1_path: Path to first image
            img2_path: Path to second image
            threshold: Distance threshold (lower = stricter).
                       Typical values:
                       - 0.3-0.4: Very strict (fewer false positives)
                       - 0.5-0.6: Normal (default, good balance)
                       - 0.6-0.7: Lenient (more matches, may have false positives)
        
        Returns:
            tuple: (similarity_score, is_same_person)
                   similarity_score: 1.0 = identical, 0.0 = completely different
                   is_same_person: boolean indicating if faces match
        """
        if not os.path.exists(img1_path):
            raise FileNotFoundError(f"Image not found: {img1_path}")
        if not os.path.exists(img2_path):
            raise FileNotFoundError(f"Image not found: {img2_path}")

        try:
            # Load images
            image1 = face_recognition.load_image_file(img1_path)
            image2 = face_recognition.load_image_file(img2_path)
            
            # Get face encodings (128-dimensional vectors)
            encodings1 = face_recognition.face_encodings(image1)
            encodings2 = face_recognition.face_encodings(image2)
            
            # Check if faces were detected
            if len(encodings1) == 0:
                raise ValueError(f"No face detected in {img1_path}. Make sure the image contains a clear, front-facing face.")
            if len(encodings2) == 0:
                raise ValueError(f"No face detected in {img2_path}. Make sure the image contains a clear, front-facing face.")
            
            # If multiple faces, use the first one
            encoding1 = encodings1[0]
            encoding2 = encodings2[0]
            
            # Calculate face distance (lower = more similar)
            # face_distance returns values typically between 0.0 and 1.0
            # 0.0 = identical faces, 1.0 = completely different
            distance = face_recognition.face_distance([encoding1], encoding2)[0]
            
            # Convert distance to similarity score (0-1, higher = more similar)
            # face_distance is already normalized, so similarity = 1 - distance
            similarity = 1.0 - distance
            
            # Determine if faces match based on threshold
            # face_recognition uses distance, so we check if distance < threshold
            is_same = distance < threshold
            
            return similarity, is_same
            
        except Exception as exc:
            raise ValueError(f"Error during face comparison: {exc}") from exc
