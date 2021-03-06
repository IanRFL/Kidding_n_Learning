import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'kidding and learning'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _questao = 0;
  int _usuario = 0;
  int _a = 0;
  int _b = 0;
  int tentativas = 0;
  String equacao = '0 + 0 = ';
  void _incrementCounter(var resposta) {
    if (resposta == _a + _b) {
      DatabaseReference _testRef =
          FirebaseDatabase.instance.reference().child("U${_usuario}Q$_questao");
      var agora = DateTime.now();
      var dia = agora.day;
      var mes = agora.month;
      var hor = agora.hour;
      var min = agora.minute;
      var seg = agora.second;
      _testRef.set(
          "$tentativas na data 2021/$dia/$mes $hor:$min:$seg, fez a questao ($_a + $_b = $resposta) e errou ${tentativas + 1 - 1} vezes");
      _a = Random().nextInt(10);
      _b = Random().nextInt(max(0, 10 - _a));
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        equacao = "$_a + $_b = ";
        tentativas = 0;
        _questao++;
      });
    } else {
      setState(() {
        tentativas++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              equacao,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$tentativas tentativas',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 20,
            bottom: 80,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () => _incrementCounter(0),
              child: Text('0'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            left: 100,
            bottom: 80,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () => _incrementCounter(1),
              child: Text('1'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            left: 180,
            bottom: 80,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () => _incrementCounter(2),
              child: Text('2'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            left: 260,
            bottom: 80,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () => _incrementCounter(3),
              child: Text('3'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            left: 340,
            bottom: 80,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () => _incrementCounter(4),
              child: Text('4'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 10,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () => _incrementCounter(5),
              child: Text('5'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            left: 100,
            bottom: 10,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () => _incrementCounter(6),
              child: Text('6'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            left: 180,
            bottom: 10,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () => _incrementCounter(7),
              child: Text('7'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            left: 260,
            bottom: 10,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () => _incrementCounter(8),
              child: Text('8'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            left: 340,
            bottom: 10,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () => _incrementCounter(9),
              child: Text('9'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          // Add more floating buttons if you want
          // There is no limit
        ],
      ),
    );
  }
}
