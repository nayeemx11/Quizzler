import 'package:flutter/material.dart';
import 'package:quizzler/questionBank.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quizzler',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Quiz question = Quiz();
  int currentQuestion = 0;
  int getTotalQuestionNumber = 0;

  List<Icon> mark = [];

  @override
  void initState() {
    super.initState();
    currentQuestion = question.getQuestionCurrentNumber();
    getTotalQuestionNumber = question.getTotalQuestionNumber();
  }

  // late int currentQuestion;
  // late int getTotalQuestionNumber;

  int totalCorrectAns = 0;
  int totalWrong = 0;

  Widget markWidget(BuildContext context) {
    // Create a list of widgets to hold the result
    List<Widget> widgets = [];

    for (var i = 0; i < mark.length; i++) {
      widgets.add(mark[i]);
    }

    // Return a widget that contains the list of widgets
    return Row(
      children: widgets,
    );
  }

  Widget exText_TF_Btn(BuildContext context, Color color, Text text) {
    return Expanded(
        child: Center(
            child: TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.fromLTRB(120, 32, 120, 32),
        textStyle: TextStyle(fontSize: 24),
      ),
      onPressed: () {
        if (currentQuestion < getTotalQuestionNumber) {
          print("$currentQuestion/$getTotalQuestionNumber");
          setState(() {
            currentQuestion = question.getQuestionCurrentNumber();
            bool correctAns = question.getQuestionAns();
            if (correctAns == true) {
              totalCorrectAns++;
              mark.add(Icon(
                Icons.check,
                color: Colors.green,
              ));
            } else {
              totalWrong++;
              mark.add(Icon(
                Icons.close,
                color: Colors.red,
              ));
            }
            question.nextQuestion();
          });
        }
      },
      child: text,
    )));
  }

  String questionTextW(BuildContext context) {
    return question.getQuestionText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          "Quizzler",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    questionTextW(context),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 50.0,
                width: 250.0,
                child: Row(
                  children: <Widget>[
                    Text(
                      'All:  $currentQuestion/$getTotalQuestionNumber Correct: $totalCorrectAns Wrong: $totalWrong',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50.0,
              width: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  markWidget(context),
                ],
              ),
            ),
            exText_TF_Btn(context, Colors.green, Text("True")),
            exText_TF_Btn(context, Colors.red, Text("False")),
          ],
        ),
      ),
    );
  }
}
