
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa29/logic/bloc/quiz_bloc.dart';
import 'package:vazifa29/logic/bloc/quiz_state.dart';

class AnswerWidget extends StatelessWidget {
  final int countLength;
  
  AnswerWidget({super.key, required this.countLength});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizeState>(
      builder: (context, state) {
        if (state is QuizeLoadedState) {
          final tappedLetters = state.tappedNum;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(countLength, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    index < tappedLetters.length ? tappedLetters[index] : '',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              );
            }),
          );
        }
        return const SizedBox();
      },
    );
  }
}