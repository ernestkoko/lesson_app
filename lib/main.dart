import 'package:flutter/material.dart';
import 'package:lessonapp/result.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });


  }

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answer':
      [{'text':'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text':'Green', 'score': 3},
        {'text': 'White', 'score': 1}]
    },
    {
      'questionText': "What's your favorite animal?",
      'answer': [{'text':'Rabbit','score': 3},
        {'text':'Snake','score':11},
        {'text':'Elephant', 'score':5},
        {'text': 'Lion', 'score': 9}]
    },
    {
      'questionText': "Who's your favorite instructor?",
      'answer': [{'text':'Max','score':1},
    {'text':'Max','score':1},
        {'text':'Max','score':1},
        {'text':'Max','score':1}]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    //setState() enables flutter re-render the class when the function is called
    setState(() {
      if (_questionIndex < _questions.length) {
        _questionIndex = _questionIndex + 1;
        print(_questionIndex);
      }
//
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBr'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex,
        questions: _questions,)
            : Result(_totalScore, _resetQuiz)
      ),
    );
  }
}
