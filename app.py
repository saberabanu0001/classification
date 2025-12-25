import streamlit as st
import tempfile
from inference import FaceAnalysis
from PIL import Image

st.set_page_config(page_title="Face Recognition", layout="centered")

st.title("Face recognition system ):")
st.write("Upload two face images to check whether they are same or not")

@st.cache_resource
def load_image():
    return FaceAnalysis()




