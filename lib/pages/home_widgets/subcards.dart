class LessonSubcard {
  String topic;
  String text;

  LessonSubcard({this.topic, this.text});

  void setName({String text}) {
    this.text = text;
  }

  void setTopic({String topic}) {
    this.topic = topic;
  }
}
