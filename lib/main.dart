import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './Widgets/Quiz.dart';
import './models/questionList.dart';
import './Widgets/Result.dart';
import 'Widgets/Pagination.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nepal Quiz',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(146, 178, 253, 1),
          errorColor: Colors.red,
          accentColor: Color.fromRGBO(173, 127, 251, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: '', fontSize: 18, fontWeight: FontWeight.bold),
                button:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    // fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )

          // fontFamily: 'Quicksand',
          ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
  // State<StatefulWidget> createState() {
  //   return new _MyHomePageState();
  // }
}

class _MyHomePageState extends State<MyHomePage> {
  // List<Map<String, Object>> get questionList {}
  var _quesList = QuestionList().getQuesList();

  int _questionIndex = 0;
  int _totalSocre = 0;

  void _answerques(int score) {
    _totalSocre += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
      print(_questionIndex);
    });
  }

  void _resetindex(int index) {
    setState(() {
      _questionIndex = index;
    });
  }

  void _resetquiz() {
    setState(() {
      _questionIndex = 0;
      _totalSocre = 0;
    });
  }

  void nextIndex() {
    if (_questionIndex < _quesList.length)
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
  }

  void preIndex() {
    if (_questionIndex < _quesList.length && _questionIndex > 0)
      setState(() {
        _questionIndex = _questionIndex - 1;
      });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final islandscape = mediaQuery.orientation == Orientation.landscape;

    final PreferredSizeWidget appbar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Nepali Quiz'),
          )
        : AppBar(
            centerTitle: true,
            title: Text(
              'Nepali Quiz',
            ),
          ) as PreferredSizeWidget;

    // final appbar = AppBar(
    //   centerTitle: true,
    //   title: Text(
    //     'Nepali Quiz',
    //   ),
    // );

    final pageBody = SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: (mediaQuery.size.height -
                  appbar.preferredSize.height -
                  mediaQuery.padding.top) *
              1,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            color: Color.fromRGBO(238, 242, 245, 1), //rgb(238,242,245)
            //borderRadius: BorderRadius.all(),
          ),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  _questionIndex < _quesList.length
                      ? Column(
                          children: [
                            Quiz(
                              queslist: _quesList,
                              //totalscore: _totalSocre,
                              quesindex: _questionIndex,
                              answerques: _answerques,
                            ),
                            Pagination(
                              nextIndex,
                              preIndex,
                            )
                          ],
                        )
                      : Result(_totalSocre, _resetquiz),
                ],
              ),

              // PaginationPage(_questionIndex);
            ],
          ),
        )
      ],
    ));

    return (Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appbar as ObstructingPreferredSizeWidget,
          )
        : Scaffold(
            appBar: appbar,
            body: pageBody,
          ));
  }
}
