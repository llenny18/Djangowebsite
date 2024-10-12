# seniorcare/prediction_service.py

import re
from datetime import datetime
from collections import defaultdict
from .factor_disease_map import factor_disease_map

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

def predict_diseases(citizen):
    """
    Predict diseases for a given citizen based on their factors.
    """
    predictions = defaultdict(list)
    
    # Calculate age and get corresponding age factor
    age = calculate_age(citizen.date_of_birth)
    age_factor_key = map_age_to_factor(age) if age is not None else None
    
    # Add diseases from age factor
    if age_factor_key:
        predictions['age_factor'].extend(factor_disease_map[age_factor_key])

    # Check other health factors and map diseases
    for factor in other_factors:
        if getattr(citizen, factor, None):
            predictions['other_factors'].extend(factor_disease_map[factor])

    # Combine predictions and remove duplicates
    combined_predictions = list(set(predictions['age_factor'] + predictions['other_factors']))
    return combined_predictions

# Example usage:
# citizen = SeniorCitizen.objects.get(citizen_id=1)
# disease_predictions = predict_diseases(citizen)
# print(disease_predictions)
