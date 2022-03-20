import 'package:flutter/material.dart';
// TODO Step 2: imprt rflutter alert
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();

  // TODO: CheckAnswer func
  void checkAnswer(bool userPickAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (userPickAnswer == correctAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      quizBrain.getNextQuestion();
      // TODO Step 4 - Use IF/ELSE to check if we reached the end of the quiz. if so, 1-show alert using rflutter_allert , 2-reset qustionNumber , 3-empty scoreKeeper
      // TODO step 6 - if we not reached the end else do the answer cheking steps below

      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          type: AlertType.none,
          title: "End Exam",
          buttons: [
            DialogButton(
              child: Text(
                "Close",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        quizBrain.reset();
        scoreKeeper = [];
      }
    });
  }

  // TODO: Create Class to mix questionText and questionAnswer
  //
  // List<String> questionText = [
  //   'Is you ahmad?',
  //   'Is you fetian?',
  //   'Is you Ans?',
  // ];

  // List<bool> questionAnswer = [
  //   false,
  //   true,
  //   false,
  // ];

// TODO: implemntion Abstraction spetate all functionality

  //  List<Question> questionBank = [ Question(
  //   q: 'Are you Ready1 ?',
  //   a: false,
  // ),
  // Question(
  //   q: 'Are you Ready2 ?',
  //   a: true,
  // ),

  //   Question(
  //   q: 'Are you Ready3 ?',
  //   a: false,
  // ),

  // ];

  // TODO: Quizbrain object
  // TODO: implemntion Encapsolation

  List<Icon> scoreKeeper = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Text(
              //TODO: show Answer

              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          flex: 5,
        ),
        Container(
          color: Colors.green,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  // TODO: implement Encapsolation
                  // quizBrain.questionBank[questionNumber].questionAnswer = false;
                  bool userPickAnswer = true;
                  checkAnswer(userPickAnswer);
                },
                child: Text("True",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
              ),
            ),
            flex: 1,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          color: Colors.red,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  bool userPickAnswer = false;
                  checkAnswer(userPickAnswer);
                },
                child: Text(
                  "False",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            flex: 1,
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
