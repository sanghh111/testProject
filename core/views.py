from django.shortcuts import render

# Create your views here.

def test_core(request):

    return render(request, 'index.html')