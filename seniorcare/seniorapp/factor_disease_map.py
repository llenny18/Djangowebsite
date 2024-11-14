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
        "Mental health disorders", "Substance abuse", "Heart disease",
        "Chronic stress"
    ],
    "lack_of_access_to_healthcare": [
        "Delayed diagnoses", "Unmanaged chronic diseases", "Poor health outcomes"
    ],
    "sleep_deprivation": [
        "Obesity", "Diabetes mellitus", "Hypertension", "Depression", 
        "Heart disease", "Weakened immune system"
    ],
    "urban_living": [
        "Asthma", "COPD", "Heart disease", "Anxiety", "Depression",
        "Type 2 Diabetes mellitus", "Cancer"
    ],
    "rural_living": [
        "Agricultural injuries", "Respiratory issues", "Skin cancer", 
        "Mental health disorders", "Musculoskeletal disorders"
    ],
    "air_quality": [
        "Asthma", "COPD", "Lung cancer", "Cardiovascular diseases",
        "Respiratory infections"
    ],
    "noise_pollution": [
        "Hypertension", "Heart disease", "Hearing loss", "Sleep disturbances", 
        "Stress-related disorders"
    ],
    "climate_change": [
        "Heat stroke", "Respiratory diseases", "Infectious diseases",
        "Allergies", "Mental health disorders"
    ],
    "access_to_nutritious_food": [
        "Malnutrition", "Obesity", "Type 2 Diabetes mellitus", 
        "Heart disease", "Mental health disorders"
    ],
    "drug_use": [
        "Addiction", "Mental health disorders", "Liver disease", 
        "Heart disease", "Infectious diseases (e.g., HIV, Hepatitis)"
    ],
    "genetic_predisposition": [
        "Cancer", "Heart disease", "Diabetes mellitus", 
        "Hypertension", "Alzheimer's disease"
    ],
    "lack_of_sanitation": [
        "Gastrointestinal diseases", "Infectious diseases", "Malnutrition",
        "Respiratory infections", "Parasitic infections"
    ],
    "radiation_exposure": [
        "Cancer", "Skin diseases", "Thyroid disorders", 
        "Cardiovascular diseases", "Genetic mutations"
    ],
    "inadequate_childhood_vaccination": [
        "Measles", "Mumps", "Rubella", "Whooping cough", 
        "Polio", "Diphtheria"
    ],
    "childhood_nutrition": [
        "Stunted growth", "Obesity", "Type 2 Diabetes mellitus", 
        "Cognitive impairments", "Immune deficiencies"
    ],
    "traumatic_brain_injury": [
        "Memory loss", "Cognitive decline", "Chronic pain", 
        "Seizure disorders", "Depression", "Anxiety"
    ],
    "domestic_abuse": [
        "Depression", "Anxiety", "Post-traumatic stress disorder (PTSD)", 
        "Chronic pain", "Heart disease"
    ],
    "homelessness": [
        "Mental health disorders", "Substance abuse", "Infectious diseases",
        "Chronic stress", "Poor nutrition"
    ],
    "long-term_medication_use": [
        "Liver disease", "Kidney damage", "Osteoporosis", 
        "Gastrointestinal issues", "Hormonal imbalances"
    ],
    "seasonal_infections": [
        "Flu", "Common cold", "Bronchitis", "Pneumonia", 
        "Respiratory syncytial virus (RSV)"
    ],
    "chronic_stress": [
        "Mental health disorders", "Heart disease", "Stroke",
        "Hypertension", "Digestive issues", "Weakened immune system"
    ],
    "social_isolation": [
        "Depression", "Anxiety", "Heart disease", "Cognitive decline", 
        "Alzheimer's disease"
    ],
    "excessive_screen_time": [
    "Eye strain", "Headaches", "Sleep disturbances", "Obesity", "Anxiety"
    ],
    "air_pollution_exposure": [
        "Asthma", "COPD", "Lung cancer", "Cardiovascular disease", "Stroke"
    ],
    "noise_pollution_exposure": [
        "Hearing loss", "Hypertension", "Sleep disturbances", "Anxiety", "Heart disease"
    ],
    "high_altitude_living": [
        "Chronic mountain sickness", "Hypoxia", "High blood pressure", "Altitude sickness"
    ],
    "pet_allergies": [
        "Asthma", "Allergic rhinitis", "Eczema"
    ],
    "pesticide_exposure": [
        "Cancer", "Neurological disorders", "Respiratory problems", "Skin irritation"
    ],
    "fertility_issues": [
        "Polycystic ovary syndrome (PCOS)", "Endometriosis", "Hormonal imbalances", "Stress"
    ],
    "occupational_stress": [
        "Heart disease", "Anxiety", "Depression", "Sleep disorders", "Hypertension"
    ],
    "frequent_flying": [
        "Deep vein thrombosis", "Jet lag", "Anxiety", "Radiation exposure"
    ],
    "poor_air_quality": [
        "Asthma", "Lung cancer", "Cardiovascular diseases", "COPD"
    ],
    "lack_of_sunlight": [
        "Vitamin D deficiency", "Depression", "Seasonal affective disorder", "Fatigue"
    ],
    "long_commutes": [
        "Stress", "Obesity", "Back pain", "Heart disease", "Sleep deprivation"
    ],
    "shift_work": [
        "Circadian rhythm disorders", "Obesity", "Diabetes mellitus", "Heart disease"
    ],
    "low_income": [
        "Mental health disorders", "Obesity", "Heart disease", "Diabetes mellitus"
    ],
    "excessive_work_hours": [
        "Burnout", "Depression", "Anxiety", "Heart disease", "High blood pressure"
    ],
    "homelessness": [
        "Infections", "Substance abuse", "Mental health disorders", "Chronic diseases"
    ],
    "low_health_literacy": [
        "Poor health outcomes", "Chronic disease progression", "Increased hospitalization"
    ],
    "substance_abuse": [
        "Liver disease", "Mental health disorders", "Heart disease", "Infections"
    ],
    "drug_addiction": [
        "Mental health disorders", "HIV/AIDS", "Hepatitis", "Respiratory infections"
    ],
    "urban_living": [
        "Asthma", "Heart disease", "Mental health disorders", "Stress", "Obesity"
    ],
    "rural_living": [
        "Chronic respiratory diseases", "Injury risk", "Mental health issues"
    ],
    "single_parenthood": [
        "Stress", "Depression", "Anxiety", "Financial strain", "Poor health outcomes"
    ],
    "frequent_moving": [
        "Stress", "Depression", "Anxiety", "Instability in healthcare access"
    ],
    "seasonal_changes": [
        "Seasonal affective disorder", "Asthma exacerbation", "Cold and flu"
    ],
    "cold_weather": [
        "Hypothermia", "Heart disease", "Respiratory infections", "Seasonal affective disorder"
    ],
    "hot_weather": [
        "Heat stroke", "Dehydration", "Kidney stones", "Skin cancer", "Sunburn"
    ],
    "lack_of_social_connection": [
        "Depression", "Anxiety", "Heart disease", "Loneliness-related disorders"
    ],
    "food_insecurity": [
        "Malnutrition", "Obesity", "Diabetes mellitus", "Mental health disorders"
    ],
    "lack_of_transportation": [
        "Poor healthcare access", "Missed appointments", "Delayed treatment", "Mental health issues"
    ],
    "home_environment_issues": [
        "Asthma", "Allergies", "Mental health disorders", "Infections"
    ],
    "substandard_housing": [
        "Respiratory infections", "Lead poisoning", "Asthma", "Mental health issues"
    ],
    "mold_exposure": [
        "Asthma", "Allergic reactions", "Respiratory infections", "Sinusitis"
    ],
    "water_contamination": [
        "Gastrointestinal infections", "Lead poisoning", "Chronic kidney disease"
    ],
    "lack_of_personal_hygiene": [
        "Infections", "Gastrointestinal diseases", "Skin conditions", "Dental disease"
    ],
    "adverse_childhood_experiences": [
        "Mental health disorders", "Heart disease", "Substance abuse", "Chronic diseases"
    ],
    "early_menopause": [
        "Osteoporosis", "Heart disease", "Anxiety", "Hormonal imbalances"
    ],
    "untreated_menstrual_problems": [
        "Anemia", "Infertility", "Endometriosis", "Chronic pelvic pain"
    ],
    "disability_status": [
        "Depression", "Anxiety", "Chronic pain", "Social isolation", "Obesity"
    ],
    "vision_impairment": [
        "Depression", "Falls", "Isolation", "Reduced quality of life"
    ],
    "hearing_impairment": [
        "Social isolation", "Cognitive decline", "Depression", "Anxiety"
    ],
    "brain_injury": [
        "Cognitive impairment", "Depression", "Seizures", "Chronic pain"
    ],
    "cognitive_decline": [
        "Alzheimer's disease", "Dementia", "Falls", "Anxiety", "Depression"
    ],
    "spinal_cord_injury": [
        "Chronic pain", "Infections", "Mobility issues", "Depression"
    ],
    "developmental_disorders": [
        "Autism spectrum disorder", "Attention-deficit/hyperactivity disorder (ADHD)", "Anxiety"
    ],
    "lack_of_family_support": [
        "Depression", "Anxiety", "Substance abuse", "Chronic stress"
    ],
    "food_intolerances": [
        "Irritable bowel syndrome (IBS)", "Gastrointestinal distress", "Chronic fatigue"
    ],
    "low_fiber_diet": [
        "Constipation", "Colorectal cancer", "Diverticulitis", "Obesity"
    ],
    "high_sugar_diet": [
        "Type 2 Diabetes mellitus", "Obesity", "Heart disease", "Tooth decay"
    ],
    "high_salt_diet": [
        "Hypertension", "Heart disease", "Kidney disease", "Stroke"
    ],
    "low_protein_diet": [
        "Muscle wasting", "Weakness", "Anemia", "Fatigue"
    ],
    "excessive_caffeine_intake": [
        "Insomnia", "Anxiety", "Heart palpitations", "Gastrointestinal issues"
    ],
    "low_calcium_intake": [
        "Osteoporosis", "Fractures", "Weak bones"
    ],
    "vitamin_b12_deficiency": [
        "Anemia", "Neuropathy", "Memory issues", "Fatigue"
    ],
    "high_fat_diet": [
        "Obesity", "Heart disease", "Diabetes mellitus", "Liver disease"
    ],
    "extreme_dieting": [
        "Malnutrition", "Electrolyte imbalances", "Fatigue", "Eating disorders"
    ],
    "gluten_intolerance": [
        "Celiac disease", "Malabsorption", "Nutritional deficiencies", "Chronic fatigue"
    ],
    "long_term_antibiotic_use": [
        "Antibiotic resistance", "Gut microbiome imbalance", "Infections"
    ],
    "heavy_metal_exposure": [
        "Kidney disease", "Neurological issues", "Respiratory diseases", "Cancer"
    ],
    "untreated_infections": [
        "Sepsis", "Chronic kidney disease", "Rheumatic heart disease"
    ],
    "unsanitary_living_conditions": [
        "Infections", "Gastrointestinal diseases", "Respiratory infections"
    ],
    "high_risk_lifestyle": [
        "STDs", "Substance abuse disorders", "Injuries", "Mental health disorders"
    ],
    "unprotected_sexual_activity": [
        "STDs", "HIV/AIDS", "Unplanned pregnancies", "Cervical cancer"
    ],
    "social_isolation": [
        "Depression", "Anxiety", "Heart disease", "Cognitive decline"
    ],
    "chronic_stress": [
        "Heart disease", "Anxiety", "Hypertension", "Gastrointestinal disorders"
    ],
    "lack_of_education": [
        "Poor health outcomes", "Chronic disease", "Mental health disorders"
    ],
    "untreated_chronic_conditions": [
        "Heart disease", "Stroke", "Kidney disease", "Liver failure"
    ],
    "living_in_conflict_zones": [
        "PTSD", "Injury", "Infectious diseases", "Mental health disorders"
    ],
    "childhood_nutrition_deficiency": [
        "Stunted growth", "Cognitive impairment", "Anemia", "Immune dysfunction"
    ],
    "heavy_workload": [
        "Burnout", "Depression", "Hypertension", "Chronic stress"
    ],
    "lack_of_sanitation": [
        "Gastrointestinal diseases", "Infections", "Parasites"
    ],
    "migration_stress": [
        "Mental health disorders", "Chronic stress", "Anxiety", "Hypertension"
    ],
    "emotional_trauma": [
        "Depression", "Anxiety", "PTSD", "Substance abuse"
    ],
    "financial_instability": [
        "Mental health issues", "Hypertension", "Chronic stress"
    ],
    "discrimination": [
        "Depression", "Anxiety", "Hypertension", "Chronic stress"
    ],
    "history_of_abuse": [
        "PTSD", "Anxiety", "Substance abuse", "Depression"
    ],
    "immunosuppression": [
        "Infections", "Cancer", "Chronic fatigue", "Opportunistic infections"
    ],
    "homeless_exposure": [
        "Infections", "Mental health issues", "Substance abuse"
    ],
    "lack_of_transport": [
        "Poor healthcare access", "Delayed treatment", "Missed appointments"
    ],
    "toxin_exposure": [
        "Cancer", "Kidney disease", "Neurological issues"
    ],
    "low_vaccination_coverage": [
        "Infectious diseases", "Outbreak risk", "Community transmission"
    ],
    "chronic_fatigue_syndrome": [
        "Sleep disturbances", "Memory issues", "Depression"
    ],
    "aging_population": [
        "Dementia", "Osteoporosis", "Chronic diseases"
    ],
    "sedentary_lifestyle": [
        "Heart disease", "Obesity", "Diabetes mellitus", "Chronic back pain"
    ],
    "overexposure_to_blue_light": [
    "Eye strain", "Sleep disturbances", "Headaches", "Macular degeneration"
    ],
    "dehydration": [
        "Kidney stones", "Urinary tract infections", "Low blood pressure", "Constipation", "Cognitive impairment"
    ],
    "chronic_back_pain": [
        "Depression", "Sleep disturbances", "Reduced mobility", "Muscle weakness"
    ],
    "extreme_weight_fluctuations": [
        "Hormonal imbalances", "Heart disease", "Metabolic syndrome", "Eating disorders"
    ],
    "exposure_to_mold": [
        "Asthma", "Allergic reactions", "Sinusitis", "Chronic fatigue"
    ],
    "high_caffeine_consumption": [
        "Insomnia", "Anxiety", "Heart palpitations", "High blood pressure", "Gastrointestinal issues"
    ],
    "excessive_exercise": [
        "Joint damage", "Hormonal imbalances", "Fatigue", "Heart problems"
    ],
    "night_shifts": [
        "Circadian rhythm disorders", "Diabetes", "Depression", "Obesity", "Heart disease"
    ],
    "high_fructose_intake": [
        "Fatty liver disease", "Diabetes", "Obesity", "Metabolic syndrome"
    ],
    "low_potassium_intake": [
        "High blood pressure", "Muscle cramps", "Heart arrhythmias", "Fatigue"
    ],
    "fasting_without_medical_guidance": [
        "Electrolyte imbalances", "Nutrient deficiencies", "Fatigue", "Hypoglycemia"
    ],
    "early_childhood_obesity": [
        "Type 2 diabetes", "Asthma", "Joint problems", "Social stigmatization"
    ],
    "late_diagnosis_of_autism": [
        "Social difficulties", "Mental health disorders", "Educational challenges"
    ],
    "binge_watching_tv": [
        "Obesity", "Sleep disturbances", "Poor posture", "Eye strain"
    ],
    "chronic_pain": [
        "Depression", "Anxiety", "Sleep disturbances", "Reduced mobility"
    ],
    "lactose_intolerance": [
        "Digestive distress", "Nutrient deficiencies", "Osteoporosis risk"
    ],
    "untreated_sleep_apnea": [
        "Hypertension", "Heart disease", "Stroke", "Daytime fatigue"
    ],
    "low_dairy_intake": [
        "Osteoporosis", "Bone fractures", "Vitamin D deficiency"
    ],
    "prolonged_use_of_screens": [
        "Digital eye strain", "Neck pain", "Sleep issues", "Mental fatigue"
    ],
    "frequent_air_travel": [
        "Deep vein thrombosis", "Jet lag", "Fatigue", "Radiation exposure"
    ],
    "unbalanced_diet": [
        "Malnutrition", "Obesity", "Vitamin deficiencies", "Chronic diseases"
    ],
    "lack_of_access_to_nutritious_food": [
        "Malnutrition", "Obesity", "Diabetes", "Heart disease"
    ],
    "hearing_loss": [
        "Social isolation", "Cognitive decline", "Depression", "Balance issues"
    ],
    "lead_exposure": [
        "Cognitive impairment", "Developmental delays", "Kidney disease"
    ],
    "untreated_mental_health_issues": [
        "Chronic stress", "Heart disease", "Substance abuse", "Sleep disturbances"
    ],
    "poor_relationship_quality": [
        "Anxiety", "Depression", "Heart disease", "High blood pressure"
    ],
    "gastroesophageal_reflux_disease": [
        "Esophageal cancer", "Chronic cough", "Asthma", "Dental erosion"
    ],
    "high_blood_sugar": [
        "Diabetes", "Heart disease", "Kidney disease", "Nerve damage"
    ],
    "anorexia_nervosa": [
        "Heart failure", "Osteoporosis", "Infertility", "Nutrient deficiencies"
    ],
    "long_term_steroid_use": [
        "Osteoporosis", "Weight gain", "High blood pressure", "Cataracts"
    ],
    "vitamin_d_deficiency": [
        "Osteoporosis", "Heart disease", "Immune dysfunction", "Cognitive decline"
    ],
    "job_loss": [
        "Depression", "Anxiety", "Substance abuse", "High blood pressure"
    ],
    "prolonged_grief": [
        "Depression", "Anxiety", "Insomnia", "Substance abuse"
    ],
    "recurrent_infections": [
        "Immune deficiencies", "Chronic fatigue", "Liver disease", "Malnutrition"
    ],
    "untreated_influenza": [
        "Pneumonia", "Bronchitis", "Sinus infections", "Chronic fatigue"
    ],
    "exposure_to_extreme_temperatures": [
        "Heat stroke", "Hypothermia", "Heart failure", "Skin cancer"
    ],
    "vitamin_c_deficiency": [
        "Scurvy", "Weakened immune system", "Gum disease", "Fatigue"
    ],
    "lack_of_caregiver_support": [
        "Burnout", "Depression", "Anxiety", "Chronic stress"
    ],
    "heavy_alcohol_consumption": [
        "Liver disease", "Heart disease", "Pancreatitis", "Cancer"
    ],
    "overworking": [
        "Burnout", "Mental health disorders", "Heart disease", "High blood pressure"
    ],
    "unresolved_conflict": [
        "Chronic stress", "High blood pressure", "Mental health disorders"
    ],
    "untreated_dental_issues": [
        "Gum disease", "Tooth decay", "Heart disease", "Infections"
    ],
    "exposure_to_loud_music": [
        "Hearing loss", "Tinnitus", "Stress", "Sleep disturbances"
    ],
    "lack_of_sleep_routine": [
        "Insomnia", "Daytime fatigue", "Memory issues", "Irritability"
    ],
    "unstable_employment": [
        "Chronic stress", "Mental health issues", "Hypertension"
    ],
    "underemployment": [
        "Depression", "Anxiety", "Financial stress", "Substance abuse"
    ],
    "childhood_neglect": [
        "PTSD", "Depression", "Anxiety", "Substance abuse"
    ],
    "high_dietary_cholesterol": [
        "Heart disease", "Atherosclerosis", "Stroke", "High blood pressure"
    ],
    "untreated_trauma": [
        "PTSD", "Anxiety", "Chronic stress", "Depression"
    ],
    "exposure_to_smoke": [
        "Lung cancer", "COPD", "Asthma", "Heart disease"
    ],
    "lack_of_physical_activity": [
        "Obesity", "Diabetes", "Heart disease", "Depression"
    ],
    "heavy_workload_in_school": [
        "Anxiety", "Sleep deprivation", "Depression", "Burnout"
    ],
    "genetic_mutations": [
        "Cancer", "Inherited diseases", "Heart disease", "Developmental issues"
    ],
    "untreated_obesity": [
        "Diabetes", "Heart disease", "Sleep apnea", "Joint issues"
    ],
    "low_birth_weight": [
        "Developmental delays", "Heart disease", "Diabetes", "Learning disabilities"
    ],
    "long_term_nicotine_use": [
        "Lung cancer", "COPD", "Heart disease", "Stroke"
    ],
    "untreated_psoriasis": [
        "Arthritis", "Mental health disorders", "Cardiovascular disease"
    ],
    "exposure_to_natural_disasters": [
        "PTSD", "Anxiety", "Depression", "Chronic stress"
    ],
    "negative_body_image": [
        "Eating disorders", "Depression", "Anxiety", "Low self-esteem"
    ],
    "lack_of_vitamin_e": [
        "Neuromuscular problems", "Vision impairment", "Immune dysfunction"
    ],
    "low_zinc_intake": [
        "Weakened immune system", "Hair loss", "Skin issues", "Diarrhea"
    ],
    "history_of_substance_abuse": [
        "Liver disease", "Mental health issues", "Cardiovascular disease"
    ],
    "lack_of_exposure_to_green_space": [
        "Depression", "Anxiety", "High blood pressure", "Stress"
    ],
    "chronic_lung_disease": [
        "COPD", "Lung cancer", "Heart disease", "Pulmonary hypertension"
    ],
    "untreated_asthma": [
        "Lung infections", "Decreased lung function", "Respiratory failure"
    ],
    "heavy_tv_watching": [
        "Obesity", "Heart disease", "Type 2 diabetes", "Sleep disorders"
    ],
    "lack_of_outdoor_activity": [
        "Vitamin D deficiency", "Obesity", "Mental health disorders", "Osteoporosis"
    ],
    "untreated_inflammatory_diseases": [
        "Heart disease", "Cancer", "Autoimmune diseases", "Chronic pain"
    ],
    "early_alcohol_exposure": [
        "Liver disease", "Mental health disorders", "Heart disease", "Substance abuse"
    ],
    "low_levels_of_magnesium": [
        "Muscle cramps", "Fatigue", "Hypertension", "Mental health disorders"
    ],
    "low_dietary_iron": [
        "Anemia", "Fatigue", "Weakness", "Cognitive impairment"
    ],
    "exposure_to_solar_radiation": [
        "Skin cancer", "Sunburn", "Eye damage", "Aging skin"
    ],
    "gender": [
        "Male", "Female"
    ],
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
