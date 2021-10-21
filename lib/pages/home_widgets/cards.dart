import 'package:flutter/material.dart';
import 'subcards.dart';

class LessonCard {
  String? header;
  List<LessonSubcard>? lessonsSubcards;

  LessonCard({this.header});

  void addSubcard({String? topic, String? text}) {
    LessonSubcard? temp_subcard = LessonSubcard(topic: topic, text: text);

    lessonsSubcards!.add(temp_subcard);
  }
}
