# AI-Dermatology-DenseNet201
AI-powered dermatology system for multi-class skin disease classification using DenseNet201. Achieved 98% training accuracy, 96.4% validation accuracy, and 94.6% test accuracy. Includes experiments with CNNs, ResNet, EfficientNet, and class balancing.



# AI Dermatology: Skin Disease Classification

This project is our **Graduation Project** focused on building an AI-based dermatology system capable of accurately classifying different skin diseases from dermoscopic images.  

We developed a **mobile application** backed by a deep learning model (**DenseNet201**) integrated into a database for real-time classification. The system aims to assist in **early detection** and **diagnosis support** for dermatologists and healthcare providers.

---

## 📊 Results

- **Training Accuracy:** 98%
- **Validation Accuracy:** 96.4%
- **Test Accuracy:** 94.6%

---

## 🚀 Features

- **DenseNet201** as the final model for optimal accuracy  
- Tried multiple architectures: CNN, ResNet, EfficientNet, VGG16, and others  
- Experimented with dataset preprocessing, augmentation, and class balancing  
- Mobile application frontend (Flutter) with backend integration  
- Offline classification capability

---

## 🧠 Dataset

We used the **HAM10000** dataset containing dermoscopic images of skin lesions.  
We applied:
- Data augmentation using **ImageDataGenerator** (rotation, flips, zoom, shifts)
- Class balancing
- Preprocessing techniques to improve feature extraction

---

## 📦 Tech Stack

- **Deep Learning:** TensorFlow / Keras
- **Model:** DenseNet201 (Transfer Learning + Fine Tuning)
- **Other Models Tested:** CNN, ResNet50, EfficientNetB0, VGG16
- **Frontend:** Flutter
- **Backend:** Firebase
- **Dataset:** HAM10000
