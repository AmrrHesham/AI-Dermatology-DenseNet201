import cv2
from flask import Flask, request, jsonify, render_template, url_for
from sklearn import preprocessing
import tensorflow as tf
from PIL import Image
import numpy as np
import io
app = Flask(__name__)

# Custom preprocessing function
# This function will handle the image preprocessing steps as described
# including black border removal, resizing, and contour detection.
def preprocess_image(img, from_file_storage=False):
    # If the input is a Werkzeug FileStorage (from /predictApi), open as PIL Image
    if from_file_storage:
        img = Image.open(img.stream)
    # Convert PIL Image to OpenCV format
    img_cv = np.array(img)

    def has_black_borders(img, threshold=10):
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        mask = gray > threshold
        return not np.all(mask)

    def zoom_until_no_borders(img, zoom_step=10, min_size=50):
        while has_black_borders(img):
            h, w, _ = img.shape
            if h <= min_size or w <= min_size:
                break
            img = img[zoom_step:h - zoom_step, zoom_step:w - zoom_step]
        return img

    def apply_threshold(gray_image, lower_gray=20, upper_gray=100):
        return cv2.inRange(gray_image, lower_gray, upper_gray)

    def find_and_draw_contours(image, mask, min_contour_area=500):
        contours, _ = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        image_with_contours = image.copy()
        for contour in contours:
            if cv2.contourArea(contour) >= min_contour_area:
                cv2.drawContours(image_with_contours, [contour], -1, (0, 255, 0), 2)
        return image_with_contours

    RESIZE_DIM = (224, 224)

    if has_black_borders(img_cv):
        img_cv = zoom_until_no_borders(img_cv)

    gray = cv2.cvtColor(img_cv, cv2.COLOR_BGR2GRAY)
    blurred = cv2.GaussianBlur(gray, (5, 5), 0)
    equalized = cv2.equalizeHist(blurred)
    resized_color = cv2.resize(img_cv, RESIZE_DIM)
    resized_gray = cv2.resize(equalized, RESIZE_DIM)

    mask = apply_threshold(resized_gray)
    color_with_contours = find_and_draw_contours(resized_color, mask)

    color_with_contours = color_with_contours.astype(np.float32) / 255.0

    # Add batch dimension for model.predict if needed
    return np.expand_dims(color_with_contours, axis=0)


classes = ["Actinic keratoses", "Basal cell carcinoma", "Benign keratosis-like lesions",
           "Dermatofibroma", "Melanocytic nevi", "Melanoma", "Vascular lesions"]
model = tf.keras.models.load_model("best_densenet201_color_contour.h5")

@app.route("/predict", methods=["POST"])
def predict():
    if 'image' not in request.files:
        return jsonify({"error": "No image uploaded"}), 400
    image_file = request.files['image']
    img = Image.open(image_file.stream)
    processed_img = preprocess_image(img)
    # Convert the processed image back to displayable format for debugging
    display_img = (processed_img[0] * 255).astype(np.uint8)
    _, img_encoded = cv2.imencode('.png', cv2.cvtColor(display_img, cv2.COLOR_RGB2BGR))
    img_bytes = img_encoded.tobytes()
    with open("preprocessed_image.png", "wb") as f:
        f.write(img_bytes)
    prediction = model.predict(processed_img)
    predicted_class_idx = int(np.argmax(prediction, axis=1)[0])
    predicted_class_name = classes[predicted_class_idx]
    confidence = float(np.max(prediction))
    return jsonify({
        "class_index": predicted_class_idx,
        "class_name": predicted_class_name,
        "confidence": confidence
    })
    
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
    print("Server started at http://localhost:5000")
