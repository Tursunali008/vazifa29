import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa29/logic/bloc/quiz_bloc.dart';
import 'package:vazifa29/logic/bloc/quiz_state.dart';
import 'package:vazifa29/model/quiz_model.dart';
import 'package:vazifa29/views/widgets/keyboard_widget.dart';
import 'package:vazifa29/views/widgets/question_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final questionController = TextEditingController();
  final answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc([
        QuizeModel(
      images: "https://bygame.ru/uploads/ai/4-fotki-1-slovo-new/4/11.webp?v=1682812404",
      answer: "Reja",
    ),
    QuizeModel(
      images: "https://bygame.ru/uploads/ai/4-fotki-1-slovo-new/4/34.webp?v=1682812404",
      answer: "Udar",
    ),
    QuizeModel(
      images: "https://bygame.ru/uploads/ai/4-fotki-1-slovo-new/4/98.webp?v=1682812404",
      answer: "Internet",
    ),
    QuizeModel(
      images: "https://bygame.ru/uploads/ai/4-fotki-1-slovo-new/4/150.webp?v=1682812404",
      answer: "Kivi",
    ),
      ]),
      child: Scaffold(
        body: BlocBuilder<QuizBloc, QuizeState>(
          builder: (context, state) {
            if (state is QuizeInitialState) {
              return const Center(child: Text('Start the quiz!'));
            } else if (state is QuizeLoadedState) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/salom.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 140,
                    child: Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          (state.index + 1).toString(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 15,
                    child: Container(
                      width: 80,
                      height: 33,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.yellow,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    right: 15,
                    child: Container(
                      width: 80,
                      height: 33,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Row(
                          children: [
                            Text(
                              "50",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.diamond_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 234, 74, 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Image.network(state.quizes[state.index].images),
                        const SizedBox(height: 20),
                        
                        const SizedBox(height: 60),
                        AnswerWidget(
                          countLength: state.quizes[state.index].answer.length,
                        ),
                        const SizedBox(height: 100),
                        SingleChildScrollView(
                          child: KeybordWidget(
                            textKeybord: state.quizes[state.index].answer,
                            answerLength: state.quizes[state.index].answer.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is ErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('Something went wrong'));
            }
          },
        ),
        
      ),
    );
  }
}