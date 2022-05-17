import 'package:flutter/material.dart';
import 'package:quizz_app/Quizz/QuizzPage.dart';
import 'package:quizz_app/Service/PersonneService.dart';

import 'Settings/Color.dart';
import 'SuccessPage/SuccessPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const tag = "home";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MyApp.tag : (context) => MyApp(),
        QuizzPage.tag : (context) => QuizzPage(),
        SuccessPage.tag : (context) => SuccessPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: textColor,
          displayColor: textColor,
        ),

      ),
      title: 'Quizz',
      home: MyStatefulWidget(),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz'),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Text('Dernier Score : ' + user.lastScore.toString()),
                Container(
                  padding: EdgeInsets.all(25),
                  child: ElevatedButton(
                    child: Text("Commencer le Quizz"),
                    onPressed: () {
                      Navigator.of(context).pushNamed(QuizzPage.tag);
                    },
                  )
                )
              ],
            )
        )
      ),
    );
  }
}
