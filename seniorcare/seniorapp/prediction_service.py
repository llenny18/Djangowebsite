# seniorcare/prediction_service.py

import re
import os
from datetime import datetime, date
from collections import defaultdict
from .factor_disease_map import factor_disease_map
from sklearn.svm import SVC
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MultiLabelBinarizer
from sklearn.multiclass import OneVsRestClassifier
import numpy as np
import joblib  # For saving/loading the model

# List of factors excluding age ranges
factors = list(factor_disease_map.keys())
age_factors = [key for key in factors if key.startswith("age_")]
other_factors = [factor for factor in factors if not factor.startswith("age_")]

def calculate_age(dob):
    """
    Calculate age from date of birth.
    """
    if not dob:
        return None
    today = datetime.today()
    
    # Check if dob is a datetime.date object
    if isinstance(dob, date):
        dob = dob  # dob is already in the correct format
    else:
        try:
            dob = datetime.strptime(dob, '%Y-%m-%d')
        except ValueError:
            return None
            
    age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
    return age

def map_age_to_factor(age):
    """
    Map the calculated age to the corresponding age range factor.
    """
    if 1 <= age <= 10:
        return "age_1_10"
    elif 11 <= age <= 20:
        return "age_11_20"
    elif 21 <= age <= 30:
        return "age_21_30"
    elif 31 <= age <= 40:
        return "age_31_40"
    elif 41 <= age <= 50:
        return "age_41_50"
    elif 51 <= age <= 60:
        return "age_51_60"
    elif 61 <= age <= 70:
        return "age_61_70"
    elif 71 <= age <= 80:
        return "age_71_80"
    elif 81 <= age <= 90:
        return "age_81_90"
    elif 91 <= age <= 100:
        return "age_91_100"
    return None


def prepare_data_for_training():
    """
    Prepare data for training by converting factors to binary features and diseases to labels.
    This function uses the provided 'factor_disease_map' and the input dataset 'data'.
    """
    # Creating a binary dataset based on the factors
    # Example: if a person has the factor 'age_1_10', it would map to diseases in that range
    binary_data = []
    label_data = []
    
    # Iterate over the factors and map them to disease labels
    for factor, diseases in factor_disease_map.items():
        # Binary indicator for each factor (1 if factor applies, 0 if not)
        binary_row = [1 if factor in factors else 0 for factor in factor_disease_map]
        binary_data.append(binary_row)

        # Multi-hot encoded disease labels
        disease_row = [1 if disease in diseases else 0 for disease in mlb.classes_]
        label_data.append(disease_row)
    
    # Convert the binary data and label data to numpy arrays
    binary_data = np.array(binary_data)
    label_data = np.array(label_data)

    return binary_data, label_data

def train_svm_model():
    """
    Train an SVM model for predicting diseases based on factors.
    """
    X, y = prepare_data_for_training()

    # Split the data into training and test sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Initialize the SVM model with a One-vs-Rest strategy
    svm_classifier = OneVsRestClassifier(SVC(kernel='linear', probability=True))  # Using linear kernel for simplicity
    svm_classifier.fit(X_train, y_train)
    
    directory_model = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'svm_model.pkl')

    # Save the trained model to disk
    joblib.dump(svm_classifier, directory_model)

    # Evaluate the model (optional)
    score = svm_classifier.score(X_test, y_test)
    print(f"SVM model accuracy: {score:.4f}")


def predict_diseases(factors, model, label_encoder):
    """
    Predict the most likely disease based on the provided factors using the trained model.
    
    Parameters:
    - factors: a dictionary of factors (e.g., age, smoking, etc.)
    - model: the trained machine learning model
    - label_encoder: the MultiLabelBinarizer used for encoding the diseases
    
    Returns:
    - The most likely predicted disease
    """
    # Convert input factors into the corresponding binary vector
    input_vector = [1 if factor in factors else 0 for factor in factor_disease_map]

    # Predict using the trained model (assuming it's a classification model)
    prediction = model.predict([input_vector])

    # Get the index of the highest prediction value
    predicted_index = np.argmax(prediction)  # This gets the index with the highest probability

    # Decode the index back to the disease label
    predicted_label = label_encoder.inverse_transform([[predicted_index]])  # Make sure it's in a 2D format
    
    return predicted_label[0]  # Return the most likely disease


# Example usage:
# citizen = SeniorCitizen.objects.get(citizen_id=1)
# disease_predictions = predict_diseases(citizen)
# print(disease_predictions)
