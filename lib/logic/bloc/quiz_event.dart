abstract class QuizEvent {}

class AddTappedLetter extends QuizEvent {
  final String letter;

  AddTappedLetter(this.letter);
}

class NextQuestion extends QuizEvent {}

class ResetQuiz extends QuizEvent {}