# Generated by Django 5.1 on 2024-10-12 16:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('seniorapp', '0009_alter_predicteddisease_options'),
    ]

    operations = [
        migrations.CreateModel(
            name='SeniorCitizenDiseaseView',
            fields=[
                ('citizen_id', models.IntegerField(primary_key=True, serialize=False)),
                ('first_name', models.CharField(max_length=50)),
                ('last_name', models.CharField(max_length=50)),
                ('date_of_birth', models.DateField()),
                ('health_condition', models.CharField(max_length=100)),
                ('gender', models.CharField(max_length=10)),
                ('address', models.CharField(max_length=100)),
                ('phone', models.CharField(max_length=15)),
                ('treatments', models.CharField(max_length=355)),
                ('checkups', models.CharField(max_length=355)),
                ('disease_name', models.CharField(max_length=255, null=True)),
                ('score', models.FloatField(default=1)),
                ('prediction_rank', models.IntegerField(default=1)),
                ('disease_prediction_date', models.DateTimeField(null=True)),
            ],
            options={
                'db_table': 'senior_citizen_disease_view',
                'managed': False,
            },
        ),
    ]
