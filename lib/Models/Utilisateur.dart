import 'package:flutter/material.dart';

class Utilisateur {
  //String name;
  int points = 0;
  int lastScore = 0;
  int progression = 0;
  DateTime date;

  Utilisateur(this.points, this.lastScore, this.progression, this.date);
}
