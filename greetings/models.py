from django.db import models

class Greeting(models.Model):
    text = models.CharField(max_length=50)
