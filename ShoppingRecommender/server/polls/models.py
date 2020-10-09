from django.db import models

# Create your models here.

class Receive(models.Model):
	area         = models.CharField(max_length=10)

	def __str__(self):
		return self.area

class Send(models.Model):
	receive      = models.ForeignKey(Receive, on_delete=models.CASCADE, blank=True)
	product_name = models.CharField(max_length=100)
	price        = models.IntegerField(default=0)
	detail       = models.CharField(max_length=300)

	def __str__(self):
		return self.product_name