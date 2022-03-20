import 'dart:collection';

class Question {
  String questionText = '';
  bool questionAnswer = false;

  Question({q, a}) {
    this.questionText = q;
    this.questionAnswer = a;
  }
}
