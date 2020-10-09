import json

from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.urls import reverse
from django.core import serializers
from django.core.serializers.json import DjangoJSONEncoder

from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.decorators import api_view
from polls.forms import *
from polls.models import Receive, Send
from polls.serializer import ReceiveSerializer, SendSerializer

# Create your views here.

def select(request):
	receive_list = Receive.objects.all()
	context = {'receive_list': receive_list}
	return render(request, 'polls/select.html', context)

def list(request, receive_id):
	try:
		receive = Receive.objects.get(pk=receive_id)
	except Receive.DoesNotExist:
		raise Http404("This area does not exist")
	return render(request, 'polls/list.html', {'receive':receive})

def add(request, receive_id):
	form = Form()
	return render(request, 'polls/add.html', {'form': form})

@api_view(['POST'])
def posts(request, receive_id):
	data = Send.objects.all()
	data = SendSerializer(data.values(), many=True)
	return JsonResponse(data.data, safe=False)

"""
class posts(viewsets.ModelViewSet):
	queryset = Send.objects.get(pk=receive_id)
	serilizer_class = SendSerializer

"""