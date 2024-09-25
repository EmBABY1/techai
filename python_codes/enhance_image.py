# enhance_image.py
import cv2
import sys

image_path = sys.argv[1]
image = cv2.imread(image_path)
enhanced_image = cv2.detailEnhance(image, sigma_s=10, sigma_r=0.15)
output_path = 'enhanced_image.jpg'
cv2.imwrite(output_path, enhanced_image)
print(output_path)
