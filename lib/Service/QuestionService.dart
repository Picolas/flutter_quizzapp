import 'package:flutter/material.dart';
import 'package:quizz_app/Models/QuizQuestion.dart';

const TYPE_STRING = "string";
const TYPE_YES_NO = "yes_no";
const TYPE_MULTIPLE_BUTTON = "multiple_button";

List<QuizzQuestion> listQuizzQuestions = [
  QuizzQuestion(Image.asset('assets/images/quizz/chichen_itza.jpeg', fit: BoxFit.cover), "Ou se trouve ce monument ?", TYPE_MULTIPLE_BUTTON, ["Mexique", "Perou", "Argentine"], ["Mexique"], 1000),
  QuizzQuestion(Image.asset('assets/images/quizz/chichen_itza.jpeg', fit: BoxFit.cover), "Est-ce que ce monument est au mexique ?", TYPE_YES_NO, [], ["Oui"], 1000),
  QuizzQuestion(Image.asset('assets/images/quizz/chichen_itza.jpeg', fit: BoxFit.cover), "Quelle est ce monument ?", TYPE_STRING, ["Chichen Itza"].toList(), [], 1000),
  QuizzQuestion(Image.asset('assets/images/quizz/christ_bresil.jpeg', fit: BoxFit.cover), "Ou se trouve cette image ?", TYPE_STRING, ["Brésil", "B"].toList(), [], 200),
  QuizzQuestion(Image.asset('assets/images/quizz/colisee_rome.jpeg', fit: BoxFit.cover), "Quelle est ce monument ?", TYPE_STRING, ["Colisee", "Le Colisée", "Le Colisée de Rome", "Colisée"].toList(), [], 100),
  QuizzQuestion(Image.asset('assets/images/quizz/machu_pichu.jpeg', fit: BoxFit.cover), "Quelle est ce monument ?", TYPE_STRING, ["Le Machu Pichu", "Machu Pichu"].toList(), [], 500),
  QuizzQuestion(Image.asset('assets/images/quizz/muraille_chine.jpeg', fit: BoxFit.cover), "Ou se trouve cette image ?", TYPE_STRING, ["Chine", "En chine"].toList(), [], 200),
  QuizzQuestion(Image.asset('assets/images/quizz/petra.jpeg', fit: BoxFit.cover), "Quelle est ce monument ?", TYPE_STRING, ["Petra"].toList(), [], 1000),
  QuizzQuestion(Image.asset('assets/images/quizz/piramides_gizeh.jpeg', fit: BoxFit.cover), "Dans quelle ville se trouve cette image ?", TYPE_STRING, ["Gizeh", "A Gizeh"].toList(), [], 350),
  QuizzQuestion(Image.asset('assets/images/quizz/taj_mahal.jpeg', fit: BoxFit.cover), "Quelle est ce monument ?", TYPE_STRING, ["Taj Mahal", "Le Taj Mahal"].toList(), [], 200),
  QuizzQuestion(Image.asset('assets/images/quizz/tour_effeil.jpeg', fit: BoxFit.cover), "Quelle est la taille de la tour effeil ?", TYPE_STRING, ["300", "300 metres"].toList(), [], 1500),
  QuizzQuestion(Image.asset('assets/images/quizz/tour_pise.jpeg', fit: BoxFit.cover), "Quelle est ce monument ?", TYPE_STRING, ["La tour de pise", "Tour de pise"].toList(), [], 450),
];