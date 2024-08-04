# Generated by Django 5.0.7 on 2024-08-04 03:05

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='SeniorCitizen',
            fields=[
                ('citizen_id', models.AutoField(primary_key=True, serialize=False)),
                ('first_name', models.CharField(max_length=50)),
                ('last_name', models.CharField(max_length=50)),
                ('date_of_birth', models.DateField()),
                ('gender', models.CharField(max_length=10)),
                ('health_condition', models.TextField()),
                ('address', models.CharField(max_length=255)),
                ('phone', models.CharField(max_length=15)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'SeniorCitizen',
            },
        ),
    ]
