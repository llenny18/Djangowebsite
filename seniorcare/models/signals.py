# seniorcare/signals.py

from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import SeniorCitizen, PredictedDisease
from .prediction_service import extract_factors, predict_diseases
from django.db import transaction

@receiver(post_save, sender=SeniorCitizen)
def create_or_update_predictions(sender, instance, created, **kwargs):
    """
    Signal to create or update predicted diseases after a SeniorCitizen instance is saved.
    """
    # Extract factors
    factors = extract_factors(instance)
    
    # Predict diseases
    predicted = predict_diseases(factors, top_n=5)
    
    # Update the SeniorCitizen instance
    instance.extracted_factors = factors
    instance.predicted_diseases = predicted
    instance.save(update_fields=['extracted_factors', 'predicted_diseases'])
    
    # Update PredictedDisease records
    with transaction.atomic():
        # Delete existing predictions
        PredictedDisease.objects.filter(citizen=instance).delete()
        
        # Create new predictions
        for rank, disease in enumerate(predicted, start=1):
            PredictedDisease.objects.create(
                citizen=instance,
                disease_name=disease,
                prediction_rank=rank
            )
