//for storing the data needed in this appliction

class QuizQuestion {
  //constrcutor function accepting text and list of answers an input
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  //to shuffle the options .
  List<String> getShuffledOptions() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
