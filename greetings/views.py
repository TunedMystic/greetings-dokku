from django.shortcuts import render
from django.views.generic import View

from greetings.models import Greeting


class HomeView(View):
    def get(self, request, *args, **kwargs):
        greeting_list = Greeting.objects.all()
        return render(request, 'index.html', {'greeting_list': greeting_list})
