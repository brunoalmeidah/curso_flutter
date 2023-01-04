import 'package:flutter/material.dart';
import 'package:projeto_pergunta/questionnarie.dart';
import 'result.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'answers': [
        {'text': 'Preto', 'score': 10},
        {'text': 'Vermelho', 'score': 7},
        {'text': 'Verde', 'score': 6},
        {'text': 'Branco', 'score': 4},
      ]
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'answers': [
        {'text': 'Coelho', 'score': 10},
        {'text': 'Cobra', 'score': 5},
        {'text': 'Elefante', 'score': 6},
        {'text': 'Leão', 'score': 7},
      ]
    },
    {
      'text': 'Qual é seu instrutor favorito?',
      'answers': [
        {'text': 'Maria', 'score': 10},
        {'text': 'João', 'score': 6},
        {'text': 'Leo', 'score': 8},
        {'text': 'Pedro', 'score': 4},
      ]
    }
  ];

  void _answer(int score) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }

  void _restartQuestionnarie() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: hasSelectedQuestion
            ? Questionnarie(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                onAnswer: _answer)
            : Result(_totalScore, _restartQuestionnarie),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
