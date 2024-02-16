import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/blocs/todo_list/todo_list_bloc.dart';
import 'package:task_manager/models/todo.dart';
import 'package:uuid/uuid.dart';

class DetailsScreen extends StatefulWidget {
  final String action;
  final Todo? todo;

  const DetailsScreen({
    super.key,
    required this.action,
    this.todo,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.action != "new") {
      titleController.text = widget.todo?.title ?? "N/A";
      descriptionController.text = widget.todo?.description ?? "N/A";
    } else {
      // titleController.text = "NEW";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen -> ${widget.action}'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              enabled: widget.action != "read",
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Title",
              ),
            ),
            TextField(
              enabled: widget.action != "read",
              controller: descriptionController,
              minLines: 1,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Description",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (widget.action == "read") {
                  // Implement Read
                } else {
                  final newTodo = Todo(
                    id: widget.action == "new" ? Uuid().v1() : widget.todo!.id,
                    title: titleController.text,
                    description: descriptionController.text,
                    isCompleted: widget.action == "new"
                        ? false
                        : widget.todo!.isCompleted,
                  );

                  print("ID => ${newTodo.id}");
                  if (widget.action == "new") {
                    context.read<TodoListBloc>().add(AddTodo(todo: newTodo));
                  }
                  if (widget.action == "edit") {
                    context.read<TodoListBloc>().add(UpdateTodo(todo: newTodo));
                  }
                }
                context.pop();
              },
              child: Text(widget.action == "read" ? "DONE" : "SAVE"),
            ),
          ],
        ),
      ),
    );
  }
}
