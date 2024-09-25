# face_recognition.py
import cv2
import sys

# تحميل الصورة من المعاملات
image_path = sys.argv[1]
image = cv2.imread(image_path)

# تحميل مصنف التعرف على الوجوه
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

# تحويل الصورة إلى درجات الرمادي
gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# اكتشاف الوجوه
faces = face_cascade.detectMultiScale(gray_image, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

# عدد الوجوه المكتشفة
num_faces = len(faces)

# طباعة عدد الوجوه
print(num_faces)
