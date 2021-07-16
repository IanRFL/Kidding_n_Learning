import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_covid19/pages/list.dart';
import 'package:quiz_covid19/pages/quiz_page.dart';
import 'package:firebase_database/firebase_database.dart';

class FinishDialog {
  static var now = DateTime.now();
  static Future show(
    BuildContext context, {
    @required int hitNumber,
    @required int questionNumber,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: CircleAvatar(
            backgroundColor: Colors.green,
            maxRadius: 35.0,
            child: Icon(
              hitNumber < 6 ? Icons.warning : Icons.favorite,
              color: Colors.grey.shade900,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'PARABÉNS!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Você acertou $hitNumber de $questionNumber!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Que tal tentar mais uma vez? Se não conseguiu, quem sabe você consegue acertar todas na próxima?!',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('COMPARTILHAR com a Nuvem'),
              onPressed: () {
                DatabaseReference _testRef = FirebaseDatabase.instance.reference().child("Número de Acertos: $hitNumber");
                _testRef.set("Timestamp: $now");
              },
            ),
            TextButton(
              child: const Text('JOGAR NOVAMENTE'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
            ),
            TextButton(
              child: const Text('SAIR'),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            TextButton(
              child: const Text('Outros Questionários'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Listq()),
                );
              },
            )
          ],
        );
      },
    );
  }
}
