import 'package:flutter/material.dart';
import 'package:test/data/questions.dart';
import 'package:test/questions_screen.dart';
import 'package:test/results_screen.dart';
import 'package:test/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = "start-screen";
  List<String> selectedAnswer = [];

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      // selectedAnswer = [];
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void switchScreen(String screenName) {
    setState(() {
      activeScreen = screenName;
      // "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "question-screen") {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(switchScreen, chosenAnswer: selectedAnswer);
    } else {
      selectedAnswer = [];
      screenWidget = StartScreen(switchScreen);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(40),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 55, 7, 189),
            Color.fromARGB(255, 113, 13, 201)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: screenWidget,
        ),
      ),
    );
  }
}
