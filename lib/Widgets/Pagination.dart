import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'AdaptiveButton.dart';

class Pagination extends StatelessWidget {
  final VoidCallback nextIndexHandler;
  final VoidCallback preIndexHandler;

  Pagination(this.nextIndexHandler, this.preIndexHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: <Widget>[
          //Size(width, height),
          AdaptiveButton(
            buttontext: 'Prev',
            handler: preIndexHandler,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
          AdaptiveButton(
            buttontext: 'Next',
            handler: nextIndexHandler,
          ),
        ],
      ),
    );
  }
}
