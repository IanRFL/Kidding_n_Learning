import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quiz_covid19/pages/list.dart';

class Usuario extends StatefulWidget {
  @override
  _UsuarioState createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final letterButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "a",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
            name += "a";
            setState(() {});
          }),
    );
    final letterBButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "b",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
            name += "b";
            setState(() {});
          }),
    );
    final okButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Ok",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
            DatabaseReference _testRef =
                FirebaseDatabase.instance.reference().child("Name: $name");
            _testRef.set("");
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Listq()));
          }),
    );
    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        letterButton,
        Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 70),
          child: letterBButton,
        ),
        okButton,
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xff8c52ff),
      body: Padding(
        padding: EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buttons,
            Padding(
              padding: EdgeInsets.only(bottom: 100),
            )
          ],
        ),
      ),
    );
  }
}
