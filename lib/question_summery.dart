import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummery extends StatelessWidget {
  const QuestionSummery({required this.summeryData, super.key});

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summeryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: data["user_answer"] == data["correct_answer"]
                        ? const Color.fromARGB(255, 129, 224, 132)
                        : const Color.fromARGB(255, 224, 129, 129),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    ((data["question_index"] as int) + 1).toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data["question"] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 254, 253, 255),
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        data["user_answer"] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 217, 181, 243),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        data["correct_answer"] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 129, 224, 132),
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
