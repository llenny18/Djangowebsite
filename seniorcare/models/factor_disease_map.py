# seniorcare/factor_disease_map.py

# Enhanced factor_disease_map with comprehensive mappings and age ranges
factor_disease_map = {
    # Existing factors and their disease mappings
    "age_1_10": [
        "Chickenpox", "Asthma", "Type 1 Diabetes mellitus", "Celiac disease"
    ],
    "age_11_20": [
        "Anemia", "Depression", "Eating disorders", "Asthma", "Type 1 Diabetes mellitus"
    ],
    "age_21_30": [
        "Hypertension", "Type 2 Diabetes mellitus", "Depression", "Anxiety",
        "Asthma", "Heart disease"
    ],
    "age_31_40": [
        "Hypertension", "Type 2 Diabetes mellitus", "Heart disease",
        "Depression", "Anxiety", "Obesity"
    ],
    "age_41_50": [
        "Hypertension", "Type 2 Diabetes mellitus", "Heart disease",
        "Obesity", "Osteoarthritis", "Depression", "Anxiety"
    ],
    "age_51_60": [
        "Hypertension", "Type 2 Diabetes mellitus", "Heart disease",
        "Obesity", "Osteoarthritis", "Depression", "Anxiety",
        "Osteoporosis"
    ],
    "age_61_70": [
        "Hypertension", "Type 2 Diabetes mellitus", "Heart disease",
        "Obesity", "Osteoarthritis", "Depression", "Anxiety",
        "Osteoporosis", "Alzheimer's disease", "Parkinson's disease"
    ],
    "age_71_80": [
        "Hypertension", "Type 2 Diabetes mellitus", "Heart disease",
        "Obesity", "Osteoarthritis", "Depression", "Anxiety",
        "Osteoporosis", "Alzheimer's disease", "Parkinson's disease",
        "Stroke", "Chronic kidney disease"
    ],
    "age_81_90": [
        "Hypertension", "Type 2 Diabetes mellitus", "Heart disease",
        "Osteoarthritis", "Depression", "Anxiety",
        "Osteoporosis", "Alzheimer's disease", "Parkinson's disease",
        "Stroke", "Chronic kidney disease", "Cancer"
    ],
    "age_91_100": [
        "Hypertension", "Heart disease", "Osteoarthritis",
        "Alzheimer's disease", "Parkinson's disease",
        "Stroke", "Chronic kidney disease", "Cancer",
        "Respiratory infections", "Bone fractures"
    ],
    # Existing factors and their disease mappings
    "gender": [
        "Breast cancer", "Prostate cancer", "Osteoporosis", "Heart disease"
    ],
    "smoking": [
        "Lung cancer", "Chronic obstructive pulmonary disease (COPD)", "Heart disease",
        "Stroke", "Asthma"
    ],
    "alcohol_use": [
        "Liver cirrhosis", "Pancreatitis", "Liver cancer", "Stroke", "Hypertension"
    ],
    "obesity": [
        "Type 2 Diabetes mellitus", "Heart disease", "Osteoarthritis", "Hypertension",
        "Stroke", "Certain cancers (e.g., breast, colon)"
    ],
    "sedentary_lifestyle": [
        "Obesity", "Heart disease", "Type 2 Diabetes mellitus", "Osteoporosis",
        "Depression", "Hypertension"
    ],
    "family_history_of_heart_disease": [
        "Heart disease", "Hypertension", "Stroke", "Atherosclerosis"
    ],
    "diabetes": [
        "Heart disease", "Kidney disease", "Neuropathy", "Retinopathy",
        "Foot ulcers", "Stroke"
    ],
    "high_blood_pressure": [
        "Stroke", "Heart disease", "Kidney disease", "Aneurysm"
    ],
    "high_cholesterol": [
        "Heart disease", "Stroke", "Atherosclerosis", "Peripheral artery disease"
    ],
    "stress": [
        "Heart disease", "Stroke", "Mental health issues", "Hypertension",
        "Gastrointestinal disorders"
    ],
    "poor_diet": [
        "Obesity", "Heart disease", "Diabetes mellitus", "Malnutrition",
        "Hypertension", "Certain cancers"
    ],
    "lack_of_exercise": [
        "Obesity", "Heart disease", "Diabetes mellitus", "Osteoporosis",
        "Depression", "Hypertension"
    ],
    "environmental_pollutants": [
        "Lung cancer", "COPD", "Asthma", "Cardiovascular diseases",
        "Skin diseases"
    ],
    "genetic_disorders": [
        "Cystic fibrosis", "Huntington's disease", "Muscular dystrophy",
        "Sickle cell disease", "Hemophilia", "Thalassemia"
    ],
    "chronic_inflammation": [
        "Arthritis", "Crohn's disease", "Ulcerative colitis", "Psoriasis",
        "Cardiovascular diseases", "Type 2 Diabetes mellitus"
    ],
    "autoimmune_disorders": [
        "Lupus", "Multiple sclerosis", "Type 1 Diabetes mellitus",
        "Celiac disease", "Rheumatoid arthritis", "Hashimoto's thyroiditis"
    ],
    "immunodeficiency": [
        "HIV/AIDS", "Tuberculosis", "Hepatitis B", "Hepatitis C",
        "Opportunistic infections"
    ],
    "medication_side_effects": [
        "Anemia", "Osteoporosis", "Liver disease", "Hypertension",
        "Gastrointestinal issues"
    ],
    "excessive_sun_exposure": [
        "Skin cancer", "Melanoma", "Actinic keratosis"
    ],
    "previous_hospitalizations": [
        "Heart disease", "Stroke", "Infections", "Chronic kidney disease"
    ],
    "chronic_diseases": [
        "Kidney failure", "Heart failure", "COPD", "Diabetes mellitus",
        "Hypertension", "Osteoarthritis"
    ],
    "sleep_apnea": [
        "Hypertension", "Heart disease", "Stroke", "Type 2 Diabetes mellitus"
    ],
    "dental_health": [
        "Diabetes mellitus", "Heart disease", "Respiratory infections",
        "Periodontal disease"
    ],
    "mental_health": [
        "Depression", "Anxiety", "Bipolar disorder", "Schizophrenia",
        "Substance abuse"
    ],
    "seasonal_allergies": [
        "Asthma", "Sinusitis", "Allergic rhinitis"
    ],
    "hormonal_changes": [
        "Diabetes mellitus", "Thyroid disorders", "Menopause",
        "Polycystic ovary syndrome (PCOS)", "Osteoporosis"
    ],
    "nutrient_deficiencies": [
        "Anemia", "Scurvy", "Rickets", "Osteoporosis", "Fatigue"
    ],
    "chronic_pain": [
        "Fibromyalgia", "Arthritis", "Migraines", "Chronic back pain",
        "Neuropathic pain"
    ],
    "poor_sleep_quality": [
        "Obesity", "Diabetes mellitus", "Hypertension", "Depression",
        "Anxiety"
    ],
    "high_body_mass_index": [
        "Heart disease", "Type 2 Diabetes mellitus", "Certain cancers",
        "Osteoarthritis", "Hypertension"
    ],
    "previous_infections": [
        "Pneumonia", "Sepsis", "Urinary tract infections",
        "Chronic kidney disease"
    ],
    "autoimmune_conditions": [
        "Rheumatoid arthritis", "Lupus", "Thyroiditis", "Multiple sclerosis",
        "Type 1 Diabetes mellitus"
    ],
    "poor_hydration": [
        "Kidney stones", "Constipation", "Urinary tract infections",
        "Dehydration", "Electrolyte imbalances"
    ],
    "physical_injuries": [
        "Chronic pain", "Arthritis", "Muscle strains", "Tendonitis",
        "Osteoarthritis"
    ],
    "food_allergies": [
        "Anaphylaxis", "Eczema", "Asthma", "Food-induced dermatitis"
    ],
    "occupational_hazards": [
        "Lung disease", "Skin conditions", "Musculoskeletal disorders",
        "Hearing loss", "Respiratory infections"
    ],
    "vaccination_status": [
        "Influenza", "Pneumonia", "Hepatitis B", "Hepatitis A",
        "Human papillomavirus (HPV) related conditions"
    ],
    "poor_stress_management": [
        "Hypertension", "Heart disease", "Mental health disorders",
        "Gastrointestinal disorders", "Immune dysfunction"
    ],
    "social_support": [
        "Depression", "Anxiety", "Heart disease", "Alzheimer's disease",
        "Chronic stress"
    ],
    "financial_stress": [
        "Mental health disorders", "Substance abuse", "Hypertension",
        "Cardiovascular diseases", "Sleep disorders"
    ],
    "chronic_viral_infections": [
        "HIV/AIDS", "Chronic Hepatitis B", "Chronic Hepatitis C",
        "Human papillomavirus (HPV)", "Herpes simplex virus"
    ],
    "weight_fluctuations": [
        "Diabetes mellitus", "Heart disease", "Gallbladder disease",
        "Metabolic syndrome", "Liver disease"
    ],
    "family_health_history": [
        "Genetic disorders", "Cancer", "Heart disease", "Diabetes mellitus",
        "Hypertension"
    ],
    "poor_mental_health": [
        "Anxiety", "Depression", "Heart disease", "Substance abuse",
        "Chronic stress"
    ],
    "lack_of_access_to_healthcare": [
        "Chronic diseases", "Preventable conditions", "Delayed treatment",
        "Infections", "Mental health disorders"
    ],
    "exposure_to_radionuclides": [
        "Thyroid cancer", "Lung cancer", "Leukemia",
        "Other radiation-induced cancers"
    ],
    "long_term_antibiotic_use": [
        "Antibiotic resistance", "Gastrointestinal issues", "Yeast infections",
        "Clostridium difficile infection"
    ],
    "high_sodium_intake": [
        "Hypertension", "Heart disease", "Stroke", "Kidney disease"
    ],
    "high_sugar_intake": [
        "Obesity", "Type 2 Diabetes mellitus", "Heart disease",
        "Dental cavities", "Non-alcoholic fatty liver disease"
    ],
    "chronic_gastrointestinal_conditions": [
        "Gastroesophageal reflux disease (GERD)", "Irritable bowel syndrome (IBS)",
        "Crohn's disease", "Ulcerative colitis", "Diverticulitis"
    ],
    "substance_abuse": [
        "Liver disease", "Heart disease", "Mental health disorders",
        "Respiratory infections", "Neurological disorders"
    ],
    "risky_sexual_behavior": [
        "HIV/AIDS", "Sexually transmitted infections (STIs)",
        "Human papillomavirus (HPV)", "Syphilis", "Gonorrhea"
    ],
    "high_stress_jobs": [
        "Heart disease", "Anxiety", "Depression", "Burnout",
        "Hypertension"
    ],
    "underlying_health_conditions": [
        "Asthma", "Diabetes mellitus", "Hypertension", "Heart disease",
        "Chronic kidney disease"
    ],
    "lack_of_health_insurance": [
        "Delayed treatment", "Chronic diseases", "Preventable conditions",
        "Increased mortality rates", "Mental health disorders"
    ],
    "poor_wound_healing": [
        "Diabetes mellitus", "Venous insufficiency", "Anemia",
        "Chronic kidney disease", "Peripheral artery disease"
    ],
    "sedentary_work_environment": [
        "Obesity", "Diabetes mellitus", "Heart disease",
        "Musculoskeletal disorders", "Depression"
    ],
    "irregular_sleep_patterns": [
        "Insomnia", "Depression", "Anxiety", "Obesity",
        "Hypertension"
    ],
    "excessive_screen_time": [
        "Eye strain", "Obesity", "Sleep disorders", "Mental health issues",
        "Musculoskeletal pain"
    ],
    "low_self-esteem": [
        "Depression", "Anxiety", "Eating disorders", "Substance abuse",
        "Social withdrawal"
    ],
    "lack_of_mindfulness": [
        "Anxiety", "Stress", "Mental health issues",
        "Depression", "Chronic pain"
    ],
    "financial_insecurity": [
        "Stress", "Mental health issues", "Substance abuse",
        "Hypertension", "Depression"
    ],
    "food_insecurity": [
        "Malnutrition", "Chronic diseases", "Mental health issues",
        "Increased risk of infections", "Delayed treatment"
    ],
    "poor_community_support": [
        "Mental health issues", "Social isolation", "Depression",
        "Anxiety", "Substance abuse"
    ],
    "low_physical_activity": [
        "Obesity", "Diabetes mellitus", "Heart disease",
        "Osteoporosis", "Depression"
    ],
    "lack_of_knowledge_about_health": [
        "Poor diet", "Inactivity", "Preventable conditions",
        "Delayed treatment", "Chronic diseases"
    ],
    "suboptimal_chronic_disease_management": [
        "Diabetes mellitus", "Hypertension", "Heart disease",
        "Chronic kidney disease", "Stroke"
    ],
    # Add more factors with relevant disease mappings as needed
}

# Note: Ensure that age ranges cover all possible ages and that diseases are appropriately mapped.

# Adding individual age factors
for age in range(1, 101):
    key = f"age_{age}"
    # Example mappings - these should be refined based on medical expertise
    if 1 <= age <= 10:
        diseases = ["Chickenpox", "Asthma", "Type 1 Diabetes mellitus", "Celiac disease"]
    elif 11 <= age <= 20:
        diseases = ["Anemia", "Depression", "Eating disorders", "Asthma", "Type 1 Diabetes mellitus"]
    elif 21 <= age <= 30:
        diseases = ["Hypertension", "Type 2 Diabetes mellitus", "Depression", "Anxiety", "Asthma", "Heart disease"]
    elif 31 <= age <= 40:
        diseases = ["Hypertension", "Type 2 Diabetes mellitus", "Heart disease", "Depression", "Anxiety", "Obesity"]
    elif 41 <= age <= 50:
        diseases = ["Hypertension", "Type 2 Diabetes mellitus", "Heart disease", "Obesity", "Osteoarthritis", "Depression", "Anxiety"]
    elif 51 <= age <= 60:
        diseases = ["Hypertension", "Type 2 Diabetes mellitus", "Heart disease", "Obesity", "Osteoarthritis", "Depression", "Anxiety", "Osteoporosis"]
    elif 61 <= age <= 70:
        diseases = ["Hypertension", "Type 2 Diabetes mellitus", "Heart disease", "Obesity", "Osteoarthritis", "Depression", "Anxiety", "Osteoporosis", "Alzheimer's disease", "Parkinson's disease"]
    elif 71 <= age <= 80:
        diseases = ["Hypertension", "Type 2 Diabetes mellitus", "Heart disease", "Obesity", "Osteoarthritis", "Depression", "Anxiety", "Osteoporosis", "Alzheimer's disease", "Parkinson's disease", "Stroke", "Chronic kidney disease"]
    elif 81 <= age <= 90:
        diseases = ["Hypertension", "Type 2 Diabetes mellitus", "Heart disease", "Osteoarthritis", "Depression", "Anxiety", "Osteoporosis", "Alzheimer's disease", "Parkinson's disease", "Stroke", "Chronic kidney disease", "Cancer"]
    else:  # 91 <= age <= 100
        diseases = ["Hypertension", "Heart disease", "Osteoarthritis", "Alzheimer's disease", "Parkinson's disease", "Stroke", "Chronic kidney disease", "Cancer", "Respiratory infections", "Bone fractures"]
    
    # Assign the diseases to the age factor
    factor_disease_map[key] = diseases

# Note: The above mappings are illustrative. It's crucial to consult medical resources to ensure accuracy.
