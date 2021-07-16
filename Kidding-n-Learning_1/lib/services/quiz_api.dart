import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_covid19/models/question.dart';

class QuizApi {
  static Future<List<Question>> fetch() async {
    try {
      var url =
          'https://script.google.com/macros/s/AKfycbw7NUPZ1tD3FUO1N0TRdBomb4CavKiCi_N0VvxGRlb57qr4xd4/exec';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Question>.from(
            data["questions"].map((x) => Question.fromMap(x)));
      } else {
        return <Question>[];
      }
    } catch (error) {
      print(error);
      return <Question>[];
    }
  }
}
