import 'package:get/get.dart';
import 'todo.dart';

class TodoController extends GetxController {
  var todo = <Todo>[].obs;

  void addTodo(String title, String discription) {
    todo.add(Todo(title: title, discription: discription));
  }

  void toggleCompletion(int index) {
    todo[index].isCompleted = !todo[index].isCompleted;
    todo.refresh();
  }

  void delete(int index) {
    todo.removeAt(index);
  }
}
