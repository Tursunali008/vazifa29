import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa29/logic/bloc/quiz_bloc.dart';
import 'package:vazifa29/logic/bloc/quiz_event.dart';
import 'package:vazifa29/logic/bloc/quiz_state.dart';

class KeybordWidget extends StatelessWidget {
  final String textKeybord;
  final int answerLength;
  
  const KeybordWidget({super.key, required this.textKeybord, required this.answerLength});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizeState>(
      builder: (context, state) {
        if (state is QuizeLoadedState) {
          final letters = textKeybord.split('');
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: letters.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<QuizBloc>(context).add(
                    AddTappedLetter(letters[index]),
                  );
                },
                child: Text(letters[index]),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}