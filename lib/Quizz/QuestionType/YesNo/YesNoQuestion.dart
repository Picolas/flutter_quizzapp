import 'package:flutter/material.dart';
import 'package:quizz_app/Quizz/QuizzPage.dart';
import 'package:quizz_app/Service/PersonneService.dart';

import '../../../Service/QuestionService.dart';
import '../../../Settings/Color.dart';
import '../../../SuccessPage/SuccessPage.dart';

class YesNoQuestion extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MyYesNoPageState();
}

class _MyYesNoPageState extends State<YesNoQuestion> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
            child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(25),
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      child: listQuizzQuestions[user.progression].image
                  ),
                  Text(listQuizzQuestions[user.progression].question),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent,
                          ),
                          child: Text("Oui"),
                          onPressed: () {
                            if (validateAnswer("Oui")) {
                              user.points += listQuizzQuestions[user.progression].point;
                              if (user.progression !=
                                  listQuizzQuestions.length - 1) {
                                user.progression++;
                                Navigator.of(context).pushNamed(QuizzPage.tag);
                              } else {
                                Navigator.of(context).pushNamed(SuccessPage.tag);
                              }
                            } else {
                              Navigator.of(context).pushNamed(SuccessPage.tag);
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(25),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                          ),
                          child: Text("Non"),
                          onPressed: () {
                            if (validateAnswer("Non")) {
                              user.points += listQuizzQuestions[user.progression].point;
                              if (user.progression !=
                                  listQuizzQuestions.length - 1) {
                                user.progression++;
                                Navigator.of(context).pushNamed(QuizzPage.tag);
                              } else {
                                Navigator.of(context).pushNamed(SuccessPage.tag);
                              }
                            } else {
                              _showMaterialDialog();
                            }
                          },
                        ),
                      )
                    ],
                  )
                ]
            )
        )
    );
  }

  void _showMaterialDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: errorColor,
            title: Text('PERDU'),
            content: Text('La réponse était ' + listQuizzQuestions[user.progression].correctAnswer.first.toString()),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SuccessPage.tag);
                  },
                  child: Text('Fermer')),
            ],
          );
        });
  }
}

bool validateAnswer(String answer) {
  if (listQuizzQuestions[user.progression].correctAnswer.contains(answer)) {
    return true;
  }
  return false;
}
