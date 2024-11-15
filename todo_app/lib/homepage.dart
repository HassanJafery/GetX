import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'todo_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TodoController todoController = Get.put(TodoController());

  // Controllers for TextFields to capture user input
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        actions: [
          Obx(() {
            final completedCount =
                todoController.todo.where((todo) => todo.isCompleted).length;
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Completed: $completedCount',
                style: TextStyle(fontSize: 18),
              ),
            );
          }),
        ],
      ),
      body: Column(
        children: [
          // Input fields for adding a new task
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Task Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Task Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final title = titleController.text;
                    final description = descriptionController.text;
                    if (title.isNotEmpty && description.isNotEmpty) {
                      todoController.addTodo(title, description);
                      titleController.clear();
                      descriptionController.clear();
                    }
                  },
                  child: Text('Add Todo'),
                ),
              ],
            ),
          ),
          // ListView to display all the tasks
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: todoController.todo.length,
                itemBuilder: (context, index) {
                  final todo = todoController.todo[index];
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.discription),
                    trailing: SizedBox(
                      width: 130,
                      child: Row(
                        children: [
                          Checkbox(
                            value: todo.isCompleted,
                            onChanged: (value) {
                              todoController.toggleCompletion(index);
                            },
                          ),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: IconButton(
                              onPressed: () {
                                todoController.delete(index);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
