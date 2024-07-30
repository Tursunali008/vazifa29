import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa29/logic/bloc/quiz_event.dart';
import 'package:vazifa29/logic/bloc/quiz_state.dart';
import 'package:vazifa29/model/quiz_model.dart';

class QuizBloc extends Bloc<QuizEvent, QuizeState> {
  final List<QuizeModel> quizes;
  List<String> tappedNum = [];
  int index = 0;

  QuizBloc(this.quizes) : super(QuizeInitialState()) {
    on<AddTappedLetter>(_onAddTappedLetter);
    on<NextQuestion>(_onNextQuestion);
    on<ResetQuiz>(_onResetQuiz);
  }

  Future<void> _onAddTappedLetter(
      AddTappedLetter event, Emitter<QuizeState> emit) async {
    if (tappedNum.length < quizes[index].answer.length) {
      tappedNum.add(event.letter);

      if (tappedNum.length == quizes[index].answer.length) {
        await _checkAnswer(emit);
      } else {
        emit(QuizeLoadedState(
          quizes: quizes,
          tappedNum: tappedNum,
          index: index,
          isCorrectAnswer: false,
        ));
      }
    }
  }

  Future<void> _checkAnswer(Emitter<QuizeState> emit) async {
    final currentQuiz = quizes[index];
    final correctAnswer = currentQuiz.answer;
    final tappedAnswer = tappedNum.join();

    if (tappedAnswer == correctAnswer) {
      emit(QuizeLoadedState(
        quizes: quizes,
        tappedNum: tappedNum,
        index: index,
        isCorrectAnswer: true,
      ));
    } else {
      emit(QuizeLoadedState(
        quizes: quizes,
        tappedNum: tappedNum,
        index: index,
        isCorrectAnswer: false,
      ));
    }
  }

  Future<void> _onNextQuestion(
      NextQuestion event, Emitter<QuizeState> emit) async {
    if (index < quizes.length - 1) {
      index++;
      tappedNum.clear();
      emit(QuizeLoadedState(
        quizes: quizes,
        tappedNum: tappedNum,
        index: index,
        isCorrectAnswer: false,
      ));
    } else {
      emit(QuizeLoadedState(
        quizes: quizes,
        tappedNum: tappedNum,
        index: index,
        isCorrectAnswer: false,
      ));
    }
  }

  Future<void> _onResetQuiz(ResetQuiz event, Emitter<QuizeState> emit) async {
    index = 0;
    tappedNum.clear();
    emit(
      QuizeLoadedState(
        quizes: quizes,
        tappedNum: tappedNum,
        index: index,
        isCorrectAnswer: false,
      ),
    );
  }
}