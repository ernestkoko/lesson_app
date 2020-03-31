import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
class Quiz extends StatelessWidget {
 final List<Map<String, Object>> questions;
 final int questionIndex;
 final Function answerQuestion;

  Quiz({@required this.answerQuestion, @required this.questions, @required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]['questionText'],
        ),
        //the spread operator(...) takes all the values out a list and use
        // it to form another list
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
