class QuizQuestion {
  final String questionsTitle;
  final List<String> answer;

  QuizQuestion(this.questionsTitle, this.answer);

  List<String> shuffledAnswers() {
    final shuffleAnswers = List.of(answer);
    shuffleAnswers.shuffle();
    return shuffleAnswers;
  }
}
