from django.shortcuts import render
from django.http import HttpResponse


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

def index(request):
    e0 = 0;
    e1 = 0;
    e2 = 0;
    firebase=pyrebase.initialize_app(config)
    authe= firebase.auth()
    database = firebase.database()
    pag = "<h>RELATORIO DE QUESTOES DO USUARIO 0:</h>"
    pag += "<ul>"
    for i in range(30):
        questao = "U0Q" + str(i)
        q = database.child(questao).get().val()
        if(q != None):
            pag += "<li>" + str(q)[1:] + "</li>"
            if(int(q[0]) == 0):
                e0 +=1
            if(int(q[0]) == 1):
                e1 +=1
            if(int(q[0]) > 1):
                e2 +=1
    pag += "</ul>"
    pag += "<div> acertou de primeira " + str(e0) + " questoes </div>"
    pag += "<div> acertou na segunda tentativa " + str(e1) + " questoes </div>"
    pag += "<div> acertou em mais de duas tentativas " + str(e2) + " questoes </div>"
    return HttpResponse(pag);
# Create your views here.
