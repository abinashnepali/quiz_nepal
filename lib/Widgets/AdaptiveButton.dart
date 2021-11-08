import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final String buttontext;
  final VoidCallback handler;

  AdaptiveButton({required this.buttontext, required this.handler});

  @override
  Widget build(BuildContext context) {
    var butcolor = Color.fromRGBO(84, 176, 243, 1); // rgb(84,176,243)
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              buttontext,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            color: butcolor,
            onPressed: handler,
          )
        : FlatButton(
            child: Text(
              buttontext,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            color: butcolor,
            onPressed: handler,
          );
  }
}
