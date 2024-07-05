from django.urls import path
from pages.views import indexView

app_name = "pages"
urlpatterns = [
    path("", indexView, name="index"),
]