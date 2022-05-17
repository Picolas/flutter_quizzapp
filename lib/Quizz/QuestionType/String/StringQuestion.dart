import 'package:flutter/material.dart';
import 'package:quizz_app/Service/PersonneService.dart';

import '../../../Service/QuestionService.dart';
import '../../../Settings/Color.dart';
import '../../../SuccessPage/SuccessPage.dart';

class StringQuestion extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MyStringQuestionPageState();
}

class _MyStringQuestionPageState extends State<StringQuestion> {

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: TextFormField(
                              style: TextStyle(color: textColor),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Réponse',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer une réponse';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                if (value != null || !value.isEmpty) {
                                  questionAnswer = value;
                                }
                              }
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text("Valider la réponse"),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (validateAnswer(questionAnswer)) {
                                  user.points += listQuizzQuestions[user.progression].point;
                                  if (user.progression !=
                                      listQuizzQuestions.length - 1) {
                                    user.progression++;
                                    setState(() {});
                                  } else {
                                    Navigator.of(context).pushNamed(SuccessPage.tag);
                                  }
                                } else {
                                  _showMaterialDialog();
                                }
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
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
            content: Text('La réponse était ' + listQuizzQuestions[user.progression].response.first.toString()),
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
  if (listQuizzQuestions[user.progression].response.contains(answer)) {
    return true;
  }
  return false;
}
