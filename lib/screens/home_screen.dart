import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/blocs/todo_list/todo_list_bloc.dart';
import 'package:task_manager/utils/route_names.dart';

import '../models/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Todo List'),
      ),
      body: BlocBuilder<TodoListBloc, TodoListState>(
        builder: (context, state) {
          if (state is TodoListUpdated && state.todos.isNotEmpty) {
            final todos = state.todos;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                      "${todos.where((element) => element.isCompleted).toList().length}/${todos.length} Completed"),
                  SizedBox(height: 20),
                  ListView.separated(
                    itemCount: todos.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: ((context, index) {
                      return SizedBox(height: 5);
                    }),
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return buildTodoTile(context, todo);
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          } else {
            return Center(
                child: Text(
              "Nothing to see here\nClick the add button below",
              textAlign: TextAlign.center,
            ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(
            RouteNames.details,
            queryParameters: {
              "action": "new",
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget buildTodoTile(BuildContext context, Todo todo) {
  return ListTile(
    onTap: () {
      context.goNamed(
        RouteNames.details,
        queryParameters: {
          "action": "read",
        },
        extra: todo,
      );
    },
    leading: Checkbox(
      value: todo.isCompleted,
      onChanged: (bool? val) {
        context.read<TodoListBloc>().add(DoneTodo(todo: todo));
      },
    ),
    title: Text(
      todo.title,
      maxLines: 1,
      style: TextStyle(
        decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
      ),
    ),
    subtitle: Text(
      todo.description,
      maxLines: 2,
      style: TextStyle(
        decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
      ),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            context.read<TodoListBloc>().add(DeleteTodo(todo: todo));
          },
          icon: const Icon(
            Icons.delete,
            size: 30,
            color: Colors.red,
          ),
        ),
        IconButton(
          onPressed: () {
            context.goNamed(
              RouteNames.details,
              queryParameters: {
                "action": "edit",
              },
              extra: todo,
            );
          },
          icon: const Icon(
            Icons.edit,
            size: 30,
            color: Colors.green,
          ),
        ),
      ],
    ),
  );
}
