# seniorcare/svm_model.py

from sklearn import svm
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import numpy as np
from .factor_disease_map import factor_encoding
from .models import PredictiveAnalytics

def prepare_data(factors):
    # Convert factors into numerical format for SVM input
    encoded_factors = [factor_encoding[factor] for factor in factors if factor in factor_encoding]
    return np.array(encoded_factors).reshape(1, -1)

def train_svm_model(X, y):
    # Train SVM model
    model = svm.SVC(kernel='linear', probability=True)
    model.fit(X, y)
    return model

def predict_disease(factors):
    data = prepare_data(factors)
    model = train_svm_model(X_train, y_train)  # Assume X_train, y_train are available
    prediction = model.predict(data)
    confidence = model.predict_proba(data).max()

    # Save results to the PredictiveAnalytics database
    analytics = PredictiveAnalytics(
        description="SVM Disease Prediction",
        results={"disease": prediction[0], "confidence": confidence},
        created_by="system",  # Update with the actual user or creator ID
    )
    analytics.save()
    
    return prediction[0], confidence
