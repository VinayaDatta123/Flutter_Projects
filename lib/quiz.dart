import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/Gradient_Style.dart';
import 'package:quiz_app/Qustions.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  //this will be passed to the results screen
  //to hold the values of answers to the questions
  var activeScreen = 'start-screen';
  //empty declaration of widget
/*
  @override
  void initState() {
    activeScreen = Startscreen(switchScreen);
    super.initState();
  }*/

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    //to check if selected ans length is equal ans length to reset each time the questions run out.
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = Startscreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectans: chooseAnswers,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        //passing the selected ans list to chosen ans here because results screen accepts a string value.
        chosenAns: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0F2027), // Dark Blue
                Color(0xFF203A43), // Medium Blue
                Color(0xFF2C5364), // Lighter Blue
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
