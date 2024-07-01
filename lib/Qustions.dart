import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
//step 1 bring those data into here
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  //constructor function.
  const QuestionsScreen({
    super.key,
    required this.onSelectans,
  });

  final void Function(String answer) onSelectans;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionsScreen> {
  var questionIndex =
      0; //question list starts from zero to 3 for 4 of the options.

  void answerQuestion(String selectedAns) {
    widget.onSelectans(selectedAns);
    setState(() {
      questionIndex = questionIndex + 1; //count increases
    });
  } //when we click on it we need to move on to next q

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];

    return SizedBox(
      // Using this occupies as much space as possible on the app
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.white, // Set the text color to white
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //...built in keyword are pulled and added as individual elements
            ...currentQuestion.getShuffledOptions().map((answer) {
              return AnswerButton(
                answerTxt: answer,
                onClick: () {
                  answerQuestion(
                      answer); //passing our ans to the function finally.
                }, //call the answer function here to move onto next question once ans is taken.
              );
            })
          ],
        ),
      ),
    );
  }
}
