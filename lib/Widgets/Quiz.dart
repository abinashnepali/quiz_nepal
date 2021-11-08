import 'package:flutter/material.dart';

import 'Answer.dart';
import 'Question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> queslist;
  final int quesindex;
  final Function answerques;

  Quiz(
      {required this.queslist,
      required this.quesindex,
      required this.answerques});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Question(
          queslist[quesindex]['questionKey'].toString(),
        ),
        ...(queslist[quesindex]['answerKey'] as List<Map<String, Object>>)
            .map((answer) {
          return new Answer(
              () => answerques(answer['score']), answer['text'].toString());
        }).toList()
      ],
    ));
  }
}
