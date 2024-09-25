import cv2
import numpy as np
import os
import sys

def load_yolo_model():
    yolo_dir = "C:/xampp/htdocs/Project_website/python_codes/yolo"
    weights_path = os.path.join(yolo_dir, "yolov3.weights")
    cfg_path = os.path.join(yolo_dir, "yolov3.cfg")
    names_path = os.path.join(yolo_dir, "coco.names")
    
    net = cv2.dnn.readNet(weights_path, cfg_path)
    with open(names_path, "r") as f:
        classes = [line.strip() for line in f.readlines()]
    return net, classes

def detect_objects(img_path, net, classes):
    layer_names = net.getLayerNames()
    unconnected_out_layers = net.getUnconnectedOutLayers()
    print("Unconnected Out Layers:", unconnected_out_layers)

    if isinstance(unconnected_out_layers, np.ndarray):
        output_layers = [layer_names[i - 1] for i in unconnected_out_layers.flatten()]
    else:
        output_layers = [layer_names[i[0] - 1] for i in unconnected_out_layers]

    img = cv2.imread(img_path)
    if img is None:
        print(f"Error: Could not read image from path: {img_path}")
        return None

    height, width, channels = img.shape

    blob = cv2.dnn.blobFromImage(img, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
    net.setInput(blob)
    outs = net.forward(output_layers)

    class_ids = []
    confidences = []
    boxes = []

    for out in outs:
        for detection in out:
            scores = detection[5:]
            class_id = np.argmax(scores)
            confidence = scores[class_id]
            if confidence > 0.5:
                center_x = int(detection[0] * width)
                center_y = int(detection[1] * height)
                w = int(detection[2] * width)
                h = int(detection[3] * height)

                x = int(center_x - w / 2)
                y = int(center_y - h / 2)

                boxes.append([x, y, w, h])
                confidences.append(float(confidence))
                class_ids.append(class_id)

    indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)

    for i in range(len(boxes)):
        if i in indexes:
            x, y, w, h = boxes[i]
            label = str(classes[class_ids[i]])
            confidence = confidences[i]
            color = (0, 255, 0)
            cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
            cv2.putText(img, label, (x, y + 30), cv2.FONT_HERSHEY_PLAIN, 3, color, 3)

    output_dir = "C:/xampp/htdocs/Project_website/public/images/"
    output_path = os.path.join(output_dir, "detected.jpg")
    cv2.imwrite(output_path, img)

    # طباعة المسار الناتج لاستخدامه في Laravel
    print(output_path)
    
    return output_path

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python object_detection.py C:/xampp/htdocs/Project_website/public/images/'")
        sys.exit(1)

    img_path = sys.argv[1]
    net, classes = load_yolo_model()
    output_path = detect_objects(img_path, net, classes)

    if output_path:
        print(f"Output saved to {output_path}")
