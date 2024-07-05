from django.shortcuts import render, HttpResponse

# Create your views here.

def indexView(request):
    return HttpResponse("init ok")