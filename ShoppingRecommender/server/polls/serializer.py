from rest_framework import serializers
from polls.models import *

class ReceiveSerializer(serializers.ModelSerializer):
	class Meta:
		model = Receive
		fields = '__all__'

class SendSerializer(serializers.ModelSerializer):
	class Meta:
		model = Send
		depth = 1
		fields = ['receive_id', 'id', 'product_name', 'price', 'detail']