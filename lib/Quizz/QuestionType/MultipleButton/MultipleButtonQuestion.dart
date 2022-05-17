import 'package:flutter/material.dart';
import 'package:quizz_app/Service/PersonneService.dart';

import '../../../Service/QuestionService.dart';
import '../../../Settings/Color.dart';
import '../../../SuccessPage/SuccessPage.dart';
import '../../QuizzPage.dart';

class MultipleButtonQuestion extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MyMultipleButtonQuestionPageState();
}

class _MyMultipleButtonQuestionPageState extends State<MultipleButtonQuestion> {

  @override
  Widget build(BuildContext context) {
    String questionAnswer = "";

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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        physics: ScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2),
                        itemCount: listQuizzQuestions[user.progression].response.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            child: ElevatedButton(
                              child: Text(listQuizzQuestions[user.progression].response[index]),
                              onPressed: () {
                                if (validateAnswer(listQuizzQuestions[user.progression].response[index])) {
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
                          );
                        }),
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