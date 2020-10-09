from django.urls import path
from . import views

app_name = 'polls'
urlpatterns = [
	path('', views.select, name='select'),
	path('<int:receive_id>/', views.list, name='list'),
	path('<int:receive_id>/add/', views.add, name='add'),
	path('<int:receive_id>/posts/', views.posts, name='posts'),
]