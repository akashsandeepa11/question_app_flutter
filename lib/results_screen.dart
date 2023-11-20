import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/data/questions.dart';
import 'package:test/question_summery.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restart, {super.key, required this.chosenAnswer});

  final void Function(String screenName) restart;
  final List<String> chosenAnswer;

  List<Map<String, Object>> get summeryData {
    final List<Map<String, Object>> summery = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summery.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswer[i],
      });
    }

    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summeryData.where((data) {
      return data["correct_answer"] == data["user_answer"];
    }).length;

    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 217, 181, 243),
                fontSize: 24,
              ),
              textAlign: TextAlign.center),
          const SizedBox(
            height: 30,
          ),
          QuestionSummery(summeryData: summeryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: () {
              restart("start_screen");
            },
            icon: const Icon(
              Icons.restart_alt,
              color: Colors.white,
            ),
            label: const Text(
              "Restart Quez!",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
