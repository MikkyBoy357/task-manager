import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/common.dart';
import '../../../cubits/cubits.dart';
import '../../../domain/domain.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
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
        activeColor: checkColor,
        value: todo.isCompleted,
        onChanged: (bool? val) {
          context.read<TodoListCubit>().doneTodo(todo);
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
              context.read<TodoListCubit>().deleteTodo(todo);
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
}
