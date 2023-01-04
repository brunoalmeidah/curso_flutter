import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Questionnarie extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) onAnswer;
  const Questionnarie({
    Key? key,
    required this.questions,
    required this.selectedQuestion,
    required this.onAnswer,
  }) : super(key: key);

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestion
        ? questions[selectedQuestion].cast()['answers']
        : [];
    return Column(
      children: [
        Question(questions[selectedQuestion]['text'].toString()),
        ...answers.map((ans) {
          return Answer(
            ans['text'].toString(),
            () => onAnswer(int.parse(ans['score'].toString())),
          );
        }).toList()
      ],
    );
  }
}
