import 'package:flutter/material.dart';
import 'package:quiz_covid19/pages/op_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kidding & Learning',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: OpPage(),
    );
  }
}
