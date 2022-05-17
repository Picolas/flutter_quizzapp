import 'package:flutter/material.dart';
import 'package:quizz_app/Quizz/QuestionType/MultipleButton/MultipleButtonQuestion.dart';
import 'package:quizz_app/Quizz/QuestionType/String/StringQuestion.dart';
import 'package:quizz_app/Quizz/QuestionType/YesNo/YesNoQuestion.dart';
import 'package:quizz_app/Service/PersonneService.dart';

import '../Models/QuizQuestion.dart';
import '../Service/QuestionService.dart';
import '../Settings/Color.dart';
import '../SuccessPage/SuccessPage.dart';

class QuizzPage extends StatefulWidget {
  static const tag = "quizz_page";

  @override
  State<StatefulWidget> createState() => _MyQuizzPageState();
}

class _MyQuizzPageState extends State<QuizzPage> {

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String questionAnswer = "";

    return Scaffold(
      appBar: AppBar(
          title: Text("Quizz " + (user.progression + 1).toString() + "/" + listQuizzQuestions.length.toString()),
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
      ),
      body: (listQuizzQuestions[user.progression].type == TYPE_STRING) ? StringQuestion() :
        (listQuizzQuestions[user.progression].type == TYPE_YES_NO) ? YesNoQuestion() :
        MultipleButtonQuestion()
    );
  }
}

bool validateAnswer(String answer) {
  if (listQuizzQuestions[user.progression].response.contains(answer)) {
    return true;
  }
  return false;
}