from django.urls import path
import pyrebase
from . import views

config={
    "apiKey": "AIzaSyAm7QEqMfdchdmGokI_15kC6lxMpeCWXRY",
    "authDomain": "kiddingnlearning.firebaseapp.com",
    "databaseURL": "https://kiddingnlearning-default-rtdb.firebaseio.com",
    "projectId": "kiddingnlearning",
    "storageBucket": "kiddingnlearning.appspot.com",
    "messagingSenderId": "1026835598222",
    "appId": "1:1026835598222:web:6b80818fefebcacd1372df",
}
firebase=pyrebase.initialize_app(config)
authe= firebase.auth()
database = firebase.database()

urlpatterns = [
        path('',views.index,name = 'index'),
        ]
