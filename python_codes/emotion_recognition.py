import os
import sys
import cv2
import json
import numpy as np
from keras.models import load_model

# Ensure UTF-8 encoding for stdout
sys.stdout.reconfigure(encoding='utf-8')

# Suppress TensorFlow warnings
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

try:
    # Load emotion detection model
    emotion_model_path = 'C:/xampp/htdocs/Project_website/resources/views/opencv/face_classification/trained_models/fer2013_mini_XCEPTION.119-0.65.hdf5'
    emotion_classifier = load_model(emotion_model_path, compile=False)
    emotion_target_size = emotion_classifier.input_shape[1:3]

    # Emotion labels
    emotion_labels = ['Angry', 'Disgust', 'Fear', 'Happy', 'Sad', 'Surprise', 'Neutral']

    # Load image from arguments
    image_path = sys.argv[1]
    image = cv2.imread(image_path)
    gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Face detection
    face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
    faces = face_cascade.detectMultiScale(gray_image, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

    emotions = []

    # Emotion detection for each face
    for (x, y, w, h) in faces:
        roi_gray = gray_image[y:y + h, x:x + w]
        roi_gray = cv2.resize(roi_gray, (emotion_target_size))
        roi_gray = roi_gray.astype('float32') / 255
        roi_gray = np.expand_dims(roi_gray, 0)
        roi_gray = np.expand_dims(roi_gray, -1)
        emotion_prediction = emotion_classifier.predict(roi_gray)
        max_index = np.argmax(emotion_prediction[0])
        emotion = emotion_labels[max_index]
        emotions.append(emotion)

    # Output the detected emotions as JSON
    print(json.dumps(emotions))

except Exception as e:
    import traceback
    print("Error: ", traceback.format_exc(), file=sys.stderr)
