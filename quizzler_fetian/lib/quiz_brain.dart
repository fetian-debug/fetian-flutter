import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
      q: 'Are you Ready1 ?',
      a: false,
    ),
    Question(
      q: 'Are you Ready2 ?',
      a: true,
    ),
    Question(
      q: 'Are you Ready3 ?',
      a: false,
    ),
    Question(
      q: 'Are you Ready4 ?',
      a: false,
    ),
    Question(
      q: 'Are you Ready5 ?',
      a: false,
    ),
    Question(
      q: 'Are you Ready6 ?',
      a: false,
    ),
    Question(
      q: 'Are you Ready7 ?',
      a: false,
    ),
    Question(
      q: 'Are you Ready8 ?',
      a: false,
    ),
  ];

  void getNextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

// TODO Step 3: Create a method called isFinished() here that checks to see if we are at the end of the quiz.
  bool isFinished() {
    if (_questionNumber == _questionBank.length-1 ) {
      return true;
    } else {
      return false;
    }
  }

// TODO Step 5 : Create a reset() method here that sets the quetionNumber back to 0
  void reset() {
    _questionNumber = 0;
  }
}
