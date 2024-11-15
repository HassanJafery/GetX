class Todo {
  String title;
  String discription;
  bool isCompleted;

  Todo({
    required this.title,
    required this.discription,
    this.isCompleted = false,
  });
}
