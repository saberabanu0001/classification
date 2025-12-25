import streamlit as st
import tempfile
from inference import FaceAnalysis
from PIL import Image

st.set_page_config(page_title="Face Recognition", layout="centered")