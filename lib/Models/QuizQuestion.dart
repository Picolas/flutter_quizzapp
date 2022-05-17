import 'package:flutter/material.dart';

class QuizzQuestion {
  Image image;
  String question;
  String type;
  List<String> response;
  List<String> correctAnswer = [];
  int point;

  QuizzQuestion(this.image, this.question, this.type, this.response,
      this.correctAnswer, this.point);

/*
  3 type de questions
  Type string, reponse en input
  Type yes/no
  Type multiple button
   */
}