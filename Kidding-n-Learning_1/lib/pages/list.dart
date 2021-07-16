import 'package:flutter/material.dart';
import 'package:quiz_covid19/pages/quiz_page.dart';

class Listq extends StatefulWidget {
  @override
  _ListqState createState() => _ListqState();
}

class _ListqState extends State<Listq> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final logo = Image.asset(
      "assets/R.png",
      height: mq.size.height / 4,
    );
    final questionario1Button = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Questionario 1",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new QuizPage()));
          }),
    );
    final questionario2Button = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Questionario 2",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new QuizPage()));
          }),
    );
    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        questionario1Button,
        Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 70),
          child: questionario2Button,
        ),
      ],
    );

    return Scaffold(  
      backgroundColor: Color(0xff8c52ff),
      body: Padding(
        padding: EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: logo,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: buttons,
            )
          ],
        ),
      ),
    );
  }
}
