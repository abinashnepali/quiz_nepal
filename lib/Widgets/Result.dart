import 'package:flutter/material.dart';

import 'AdaptiveButton.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final VoidCallback restQuizHanlder;

  Result(this.resultscore, this.restQuizHanlder);

  String get Resulttext {
    String resultText = '';
    if (resultscore <= 8)
      resultText = 'OOPS!! Wanna Try Again?. Your Total Score : ${resultscore}';
    else if (resultscore >= 8 && resultscore < 15)
      resultText = 'Satisfaction  . Your Total Score : ${resultscore}';
    else if (resultscore >= 16 && resultscore < 20)
      resultText = 'Good  . Your Total Score : ${resultscore}';
    else if (resultscore >= 20 && resultscore < 25)
      resultText = 'Great Job. Your Total Score : ${resultscore}';
    else if (resultscore >= 26)
      resultText =
          'Congratulation !!! Your are Amazing!!!. Your Total Score : ${resultscore}';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(Resulttext,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
          AdaptiveButton(
            buttontext: 'Restart Quiz',
            handler: restQuizHanlder,
          )

          // FlatButton(onPressed: restQuizHanlder, child: Text('Restart'))
        ],
      ),
    );
  }
}
