import 'package:vazifa29/model/quiz_model.dart';

sealed class QuizeState {}

final class QuizeInitialState extends QuizeState {}

final class QuizeLoadingState extends QuizeState {}

final class QuizeLoadedState extends QuizeState {
  final List<QuizeModel> quizes;
  final List<String> tappedNum;
  final int index;
  final bool isCorrectAnswer;

  QuizeLoadedState({
    required this.quizes,
    required this.tappedNum,
    required this.index,
    required this.isCorrectAnswer,
  });
}

final class ErrorState extends QuizeState {
  final String message;

  ErrorState(this.message);
}
