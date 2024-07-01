import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Startscreen extends StatelessWidget {
  const Startscreen(this.startQuiz, {super.key});
  //using a positional argument to the start screen widget here so when we pass a void type function it gets executed
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 180,
            color: const Color.fromARGB(170, 16, 166, 180),
            //overlay colour can be added to the image.
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            "Let's get started with the Quiz",
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 73,
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz(); //input argument is a function and now we can execute it here that means when pressed the quiz should start
            }, //on press the switch screen function here passed as with another variable name startQuiz...think of function args
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.lato(),
            ),
          ),
        ],
      ),
    );
  }
}
