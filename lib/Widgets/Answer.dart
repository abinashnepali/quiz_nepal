import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answertext;

  Answer(this.selectHandler, this.answertext);

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Container(
        width: mediaquery.width * 0.7,
        margin: EdgeInsets.only(bottom: 12),
        child: RaisedButton(
          color: Color.fromRGBO(238, 242, 245, 1).withOpacity(1),
          textColor: Colors.purple.shade800,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
          child: Text(
            answertext,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          onPressed: selectHandler as VoidCallback,
        ));
  }
}
