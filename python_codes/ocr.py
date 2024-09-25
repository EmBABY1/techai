# ocr.py
import cv2
import pytesseract
import sys
import os

# تحديد مسار Tesseract
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

# تحميل الصورة من المعاملات
image_path = sys.argv[1]
image = cv2.imread(image_path)

# تحويل الصورة إلى درجات الرمادي لتحسين دقة OCR
gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# استخدام pytesseract لاستخراج النص
text = pytesseract.image_to_string(gray_image)

# طباعة النص المستخرج
print(text)
