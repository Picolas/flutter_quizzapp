import 'package:flutter/material.dart';
import 'package:quizz_app/Service/PersonneService.dart';
import 'package:quizz_app/main.dart';

import '../Service/QuestionService.dart';
import '../Settings/Color.dart';

class SuccessPage extends StatefulWidget {
  static const tag = "success_page";

  @override
  State<StatefulWidget> createState() => _MySuccessPageState();
}

class _MySuccessPageState extends State<SuccessPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quizz"),
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Expanded(
                        child: Text('Félicitation vous avez gagné ' + user.points.toString() + " points"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ElevatedButton(
                      child: Text("Revenir à l'accueil"),
                      onPressed: () {
                        user.progression = 0;
                        user.lastScore = user.points;
                        user.points = 0;
                        Navigator.of(context).pushNamed(MyApp.tag);
                      },
                    )
                  )
                ]
            )
        )
    );
  }
}